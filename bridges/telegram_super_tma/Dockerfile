FROM python:3.10-slim
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt && pip install aiohttp pyyaml redis
EXPOSE 8080
CMD ["sh", "-c", "python dashboard_api.py & python bot.py"] 