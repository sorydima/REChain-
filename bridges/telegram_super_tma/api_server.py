from aiohttp import web
import yaml
import os

# OAuth2/SSO and RBAC stubs
async def require_auth(request):
    # For demo, always allow
    return True

def json_response(data, status=200):
    return web.json_response(data, status=status)

# Health
async def health(request):
    return json_response({'status': 'ok', 'bridge': 'running'})

# Metrics
async def metrics(request):
    from dashboard_api import metrics
    return json_response(metrics)

# Logs
async def logs(request):
    try:
        with open('bridge.log') as f:
            lines = f.readlines()[-100:]
        return json_response({'log': ''.join(lines)})
    except Exception:
        return json_response({'log': 'Log unavailable'})

# Mappings
async def get_mappings(request):
    if os.path.exists('mappings.yaml'):
        with open('mappings.yaml') as f:
            mappings = yaml.safe_load(f) or {}
    else:
        mappings = {}
    return json_response({'mappings': mappings})

async def add_mapping(request):
    data = await request.json()
    tg_chat_id = data['tg_chat_id']
    mx_room_id = data['mx_room_id']
    if os.path.exists('mappings.yaml'):
        with open('mappings.yaml') as f:
            mappings = yaml.safe_load(f) or {}
    else:
        mappings = {}
    mappings[tg_chat_id] = mx_room_id
    with open('mappings.yaml', 'w') as f:
        yaml.safe_dump(mappings, f)
    return json_response({'result': 'ok'})

async def remove_mapping(request):
    data = await request.json()
    tg_chat_id = data['tg_chat_id']
    if os.path.exists('mappings.yaml'):
        with open('mappings.yaml') as f:
            mappings = yaml.safe_load(f) or {}
    else:
        mappings = {}
    if tg_chat_id in mappings:
        del mappings[tg_chat_id]
        with open('mappings.yaml', 'w') as f:
            yaml.safe_dump(mappings, f)
    return json_response({'result': 'ok'})

# Plugins
async def list_plugins(request):
    plugins = [f for f in os.listdir('plugins') if f.endswith('.py') and f != '__init__.py']
    return json_response({'plugins': plugins})

# Users & Roles
async def list_users(request):
    if os.path.exists('roles.yaml'):
        with open('roles.yaml') as f:
            roles = yaml.safe_load(f)
    else:
        roles = {'users': {}, 'roles': {}}
    return json_response({'users': roles['users']})

async def list_roles(request):
    if os.path.exists('roles.yaml'):
        with open('roles.yaml') as f:
            roles = yaml.safe_load(f)
    else:
        roles = {'users': {}, 'roles': {}}
    return json_response({'roles': roles['roles']})

# Audit log
async def audit(request):
    try:
        with open('audit.log') as f:
            lines = f.readlines()[-100:]
        return json_response({'audit': ''.join(lines)})
    except Exception:
        return json_response({'audit': 'Audit log unavailable'})

# Backup/Restore (stubs)
async def backup(request):
    os.system('./backup.sh')
    return json_response({'result': 'backup started'})

async def restore(request):
    data = await request.json()
    backup_dir = data['backup_dir']
    os.system(f'./restore.sh {backup_dir}')
    return json_response({'result': f'restore from {backup_dir} started'})

# Config (stub)
async def get_config(request):
    if os.path.exists('config.yaml'):
        with open('config.yaml') as f:
            config = yaml.safe_load(f)
    else:
        config = {}
    return json_response({'config': config})

# REChain Integrations (stubs)
async def verify_identity(request):
    data = await request.json()
    user_id = data['user_id']
    return json_response({'status': 'verified', 'user_id': user_id})

async def process_payment(request):
    data = await request.json()
    user_id = data['user_id']
    amount = data['amount']
    return json_response({'status': 'success', 'user_id': user_id, 'amount': amount})

# Dashboard stats (stubs)
async def user_stats(request):
    return json_response({'user_stats': {'alice': 10, 'bob': 5}})

async def room_stats(request):
    return json_response({'room_stats': {'room1': 7, 'room2': 3}})

app = web.Application()
app.router.add_get('/api/health', health)
app.router.add_get('/api/metrics', metrics)
app.router.add_get('/api/logs', logs)
app.router.add_get('/api/mappings', get_mappings)
app.router.add_post('/api/mappings/add', add_mapping)
app.router.add_post('/api/mappings/remove', remove_mapping)
app.router.add_get('/api/plugins', list_plugins)
app.router.add_get('/api/users', list_users)
app.router.add_get('/api/roles', list_roles)
app.router.add_get('/api/audit', audit)
app.router.add_post('/api/backup', backup)
app.router.add_post('/api/restore', restore)
app.router.add_get('/api/config', get_config)
app.router.add_post('/api/identity/verify', verify_identity)
app.router.add_post('/api/payments/process', process_payment)
app.router.add_get('/api/dashboard/user_stats', user_stats)
app.router.add_get('/api/dashboard/room_stats', room_stats)

if __name__ == '__main__':
    web.run_app(app, port=8082) 