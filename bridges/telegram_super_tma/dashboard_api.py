from aiohttp import web, WSMsgType
import yaml
import os
import asyncio
import time

MAPPINGS_FILE = 'mappings.yaml'

# Simple in-memory metrics
metrics = {
    'messages_tg_to_matrix': 0,
    'messages_matrix_to_tg': 0,
    'errors': 0,
    'start_time': time.time(),
}

def inc_metric(key):
    if key in metrics:
        metrics[key] += 1

def get_uptime():
    return int(time.time() - metrics['start_time'])

async def health(request):
    return web.json_response({'status': 'ok', 'bridge': 'running'})

async def mappings(request):
    if os.path.exists(MAPPINGS_FILE):
        with open(MAPPINGS_FILE) as f:
            mappings = yaml.safe_load(f) or {}
    else:
        mappings = {}
    return web.json_response({'mappings': mappings})

async def metrics_handler(request):
    return web.json_response({
        'messages_tg_to_matrix': metrics['messages_tg_to_matrix'],
        'messages_matrix_to_tg': metrics['messages_matrix_to_tg'],
        'errors': metrics['errors'],
        'uptime_seconds': get_uptime(),
    })

async def ws_handler(request):
    ws = web.WebSocketResponse()
    await ws.prepare(request)
    try:
        while True:
            await ws.send_json({'status': 'ok', 'msg': 'Bridge running', 'uptime': get_uptime()})
            await asyncio.sleep(5)
    except Exception:
        pass
    finally:
        await ws.close()
    return ws

async def prometheus_handler(request):
    lines = [
        f"bridge_messages_tg_to_matrix {metrics['messages_tg_to_matrix']}",
        f"bridge_messages_matrix_to_tg {metrics['messages_matrix_to_tg']}",
        f"bridge_errors {metrics['errors']}",
        f"bridge_uptime_seconds {get_uptime()}"
    ]
    return web.Response(text='\n'.join(lines), content_type='text/plain')

async def push_status_to_rechain():
    # Example: push metrics to REChain dashboard
    # import aiohttp
    # async with aiohttp.ClientSession() as session:
    #     await session.post('https://rechain.example.com/dashboard', json=metrics)
    pass  # Call this periodically or on metric update

# SSO/OAuth2 stub
async def oauth2_login(request):
    # Redirect to OAuth2 provider, handle callback, set session
    # For production, use aiohttp-oauthlib or similar
    return web.Response(text='OAuth2 login stub')

def require_auth(handler):
    async def wrapper(request):
        # Check for valid session/token (stub)
        # For production, check request.cookies or Authorization header
        # If not authenticated, redirect to /login
        return await handler(request)
    return wrapper

async def log_handler(request):
    try:
        with open('bridge.log') as f:
            lines = f.readlines()[-100:]
        return web.Response(text=''.join(lines), content_type='text/plain')
    except Exception:
        return web.Response(text='Log unavailable', content_type='text/plain')

app = web.Application()
app.router.add_get('/login', oauth2_login)
app.router.add_get('/health', require_auth(health))
app.router.add_get('/mappings', require_auth(mappings))
app.router.add_get('/metrics', require_auth(metrics_handler))
app.router.add_get('/ws', require_auth(ws_handler))
app.router.add_get('/prometheus', require_auth(prometheus_handler))
app.router.add_get('/log', log_handler)

if __name__ == '__main__':
    web.run_app(app, port=8080) 