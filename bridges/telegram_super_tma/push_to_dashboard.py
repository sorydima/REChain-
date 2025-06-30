import aiohttp
import asyncio
from dashboard_api import metrics

RECHAIN_DASHBOARD_URL = 'https://rechain.example.com/dashboard'  # Replace with real endpoint

async def push_metrics():
    async with aiohttp.ClientSession() as session:
        try:
            await session.post(RECHAIN_DASHBOARD_URL, json=metrics)
            print('Pushed metrics to REChain dashboard')
        except Exception as e:
            print(f'Failed to push metrics: {e}')

if __name__ == '__main__':
    asyncio.run(push_metrics()) 