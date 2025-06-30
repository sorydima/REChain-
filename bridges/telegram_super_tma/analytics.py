import aiohttp
import yaml

# Load config
with open('config.yaml') as f:
    config = yaml.safe_load(f)
RECHAIN_ANALYTICS_URL = config.get('rechain', {}).get('analytics_url', 'https://rechain.example.com/analytics')
RECHAIN_ANALYTICS_KEY = config.get('rechain', {}).get('analytics_api_key', 'demo-key')

async def log_event(event_type, data):
    payload = {
        'event_type': event_type,
        'data': data,
        'api_key': RECHAIN_ANALYTICS_KEY
    }
    async with aiohttp.ClientSession() as session:
        try:
            async with session.post(RECHAIN_ANALYTICS_URL, json=payload) as resp:
                if resp.status == 200:
                    print(f"[Analytics] Event logged: {event_type}")
                else:
                    print(f"[Analytics] Failed to log event: {resp.status}")
        except Exception as e:
            print(f"[Analytics] Error: {e}") 