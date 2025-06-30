
#!/bin/bash
# Установка всех docker-compose файлов

docker-compose -f docker-compose.yml up -d
docker-compose -f docker-compose.bridges.yaml up -d
docker-compose -f docker-compose.monitoring.yaml up -d
docker-compose -f docker-compose.turn.yaml up -d
