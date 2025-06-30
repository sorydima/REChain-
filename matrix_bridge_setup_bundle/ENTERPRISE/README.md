# Matrix Bridge Setup Bundle (REChain Enhanced Edition)
Сборка на основе https://github.com/sorydima/REChain- включает: Synapse, Element, Bridges, Coturn, Prometheus, Grafana.

## Состав
- `docker-compose.yml`: Synapse + Element + PostgreSQL
- `docker-compose.bridges.yaml`: mautrix-telegram, signal, imessage
- `docker-compose.monitoring.yaml`: Prometheus + Grafana + exporter
- `docker-compose.turn.yaml`: Coturn для звонков

## Запуск
```
docker-compose -f docker-compose.yml up -d
docker-compose -f docker-compose.bridges.yaml up -d
docker-compose -f docker-compose.monitoring.yaml up -d
docker-compose -f docker-compose.turn.yaml up -d
```
