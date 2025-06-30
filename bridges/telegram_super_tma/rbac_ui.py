from aiohttp import web
import yaml
import os
from aiohttp_session import setup as session_setup, get_session, SimpleCookieStorage

ROLES_FILE = 'roles.yaml'
OAUTH_CONFIG = yaml.safe_load(open('oauth_config.yaml')) if os.path.exists('oauth_config.yaml') else {}
AUDIT_LOG = 'audit.log'

async def require_auth(request):
    # SSO stub: always allow for demo
    return True

def load_roles():
    if os.path.exists(ROLES_FILE):
        with open(ROLES_FILE) as f:
            return yaml.safe_load(f)
    return {'users': {}, 'roles': {}}

def save_roles(data):
    with open(ROLES_FILE, 'w') as f:
        yaml.safe_dump(data, f)

def log_audit(msg):
    with open(AUDIT_LOG, 'a') as f:
        f.write(msg + '\n')

async def rbac_ui(request):
    if not await require_auth(request):
        return web.Response(text='Unauthorized', status=401)
    roles = load_roles()
    html = '<h2>RBAC Management</h2>'
    html += '<form method="get" action="/rbac/search"><input name="uid" placeholder="Search User ID"><button type="submit">Search</button></form>'
    html += '<h3>Users</h3><ul>'
    for uid, role in roles['users'].items():
        html += f'<li>{uid}: {role} <form style="display:inline" method="post" action="/rbac/assign"><input type="hidden" name="uid" value="{uid}"><input name="role" value="{role}"><button type="submit">Assign</button></form></li>'
    html += '</ul>'
    html += '<h3>Roles</h3><ul>'
    for role, cmds in roles['roles'].items():
        html += f'<li>{role}: {", ".join(cmds)} <form style="display:inline" method="post" action="/rbac/delete_role"><input type="hidden" name="role" value="{role}"><button type="submit">Delete</button></form></li>'
    html += '</ul>'
    html += '''<form method="post" action="/rbac/add_role">
    <input name="role" placeholder="Role">
    <input name="cmds" placeholder="Commands (comma separated)">
    <button type="submit">Add/Update Role</button></form>'''
    html += '<h3>Audit Log</h3><pre>'
    if os.path.exists(AUDIT_LOG):
        with open(AUDIT_LOG) as f:
            html += f.read()[-2000:]
    html += '</pre>'
    return web.Response(text=html, content_type='text/html')

async def search_user(request):
    uid = request.query.get('uid')
    roles = load_roles()
    role = roles['users'].get(int(uid), 'Not found')
    html = f'<h2>User Search</h2>User {uid}: {role}<br><a href="/rbac">Back</a>'
    return web.Response(text=html, content_type='text/html')

async def assign_role(request):
    data = await request.post()
    uid, role = data['uid'], data['role']
    roles = load_roles()
    roles['users'][int(uid)] = role
    save_roles(roles)
    log_audit(f'Assigned role {role} to user {uid}')
    raise web.HTTPFound('/rbac')

async def delete_role(request):
    data = await request.post()
    role = data['role']
    roles = load_roles()
    if role in roles['roles']:
        del roles['roles'][role]
        save_roles(roles)
        log_audit(f'Deleted role {role}')
    raise web.HTTPFound('/rbac')

async def add_user(request):
    data = await request.post()
    uid, role = data['uid'], data['role']
    roles = load_roles()
    roles['users'][int(uid)] = role
    save_roles(roles)
    raise web.HTTPFound('/rbac')

async def add_role(request):
    data = await request.post()
    role, cmds = data['role'], data['cmds']
    roles = load_roles()
    roles['roles'][role] = [c.strip() for c in cmds.split(',') if c.strip()]
    save_roles(roles)
    log_audit(f'Added/updated role {role}: {cmds}')
    raise web.HTTPFound('/rbac')

async def oauth2_login(request):
    # Redirect to real OAuth2 provider
    url = f"{OAUTH_CONFIG.get('auth_url')}?client_id={OAUTH_CONFIG.get('client_id')}&redirect_uri={OAUTH_CONFIG.get('redirect_uri')}&response_type=code&scope={OAUTH_CONFIG.get('scope')}"
    raise web.HTTPFound(url)

async def oauth2_callback(request):
    # Exchange code for token (stub)
    code = request.query.get('code')
    # In production, use aiohttp-oauthlib to fetch token and set session
    return web.Response(text=f'OAuth2 callback received code: {code}')

async def logout(request):
    session = await get_session(request)
    session.invalidate()
    raise web.HTTPFound('/rbac')

app = web.Application()
app.router.add_get('/rbac', rbac_ui)
app.router.add_post('/rbac/add_user', add_user)
app.router.add_post('/rbac/add_role', add_role)
app.router.add_get('/login', oauth2_login)
app.router.add_get('/oauth/callback', oauth2_callback)
app.router.add_get('/rbac/search', search_user)
app.router.add_post('/rbac/assign', assign_role)
app.router.add_post('/rbac/delete_role', delete_role)
app.router.add_get('/logout', logout)

session_setup(app, SimpleCookieStorage())

if __name__ == '__main__':
    web.run_app(app, port=8090) 