# Redis High Availability for Super TMA

For production, use Redis Sentinel or Redis Cluster for high availability and failover.

## Redis Sentinel
- Provides monitoring, notification, and automatic failover.
- Deploy at least 3 Sentinel nodes and 2+ Redis nodes.
- Update your Redis client config to use Sentinel endpoints.

## Redis Cluster
- Provides sharding and HA.
- Deploy 6+ Redis nodes (3 masters, 3 replicas minimum).
- Update your Redis client config to use cluster mode.

See the [Redis docs](https://redis.io/docs/management/sentinel/) for setup details. 