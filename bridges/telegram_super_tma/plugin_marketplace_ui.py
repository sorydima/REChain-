from aiohttp import web
import os
import shutil

PLUGINS_DIR = 'plugins'

async def require_auth(request):
    # SSO stub: always allow for demo
    return True

def list_plugins():
    plugins = []
    for fname in os.listdir(PLUGINS_DIR):
        if fname.endswith('.py') and fname != '__init__.py':
            plugins.append(fname)
    return plugins

def enable_plugin(fname):
    # For demo, just ensure file exists
    return os.path.exists(os.path.join(PLUGINS_DIR, fname))

def disable_plugin(fname):
    # For demo, just rename file
    path = os.path.join(PLUGINS_DIR, fname)
    if os.path.exists(path):
        os.rename(path, path + '.disabled')
        return True
    return False

def upload_plugin(file):
    dest = os.path.join(PLUGINS_DIR, file.filename)
    with open(dest, 'wb') as f:
        shutil.copyfileobj(file.file, f)
    return True

async def plugin_ui(request):
    if not await require_auth(request):
        return web.Response(text='Unauthorized', status=401)
    plugins = list_plugins()
    html = '<h2>Plugin Marketplace/Loader</h2>'
    html += '<ul>'
    for p in plugins:
        html += f'<li>{p} <form style="display:inline" method="post" action="/plugins/disable"><input type="hidden" name="fname" value="{p}"><button type="submit">Disable</button></form></li>'
    html += '</ul>'
    html += '''<form method="post" action="/plugins/upload" enctype="multipart/form-data">
    <input type="file" name="file">
    <button type="submit">Upload Plugin</button></form>'''
    return web.Response(text=html, content_type='text/html')

async def upload(request):
    data = await request.post()
    file = data['file']
    upload_plugin(file)
    raise web.HTTPFound('/plugins')

async def disable(request):
    data = await request.post()
    fname = data['fname']
    disable_plugin(fname)
    raise web.HTTPFound('/plugins')

app = web.Application()
app.router.add_get('/plugins', plugin_ui)
app.router.add_post('/plugins/upload', upload)
app.router.add_post('/plugins/disable', disable)

if __name__ == '__main__':
    web.run_app(app, port=8091) 