# Multi-Region & High-Availability Deployment

## Overview
- Deploy Super TMA bridge and Redis in multiple regions/zones for HA and disaster recovery.
- Use Redis Sentinel or Redis Cluster for cross-region failover.
- Use Kubernetes Deployments, StatefulSets, and Services for orchestration.

## Redis Sentinel/Cluster
- Deploy at least 3 Redis Sentinel nodes and 2+ Redis nodes across regions.
- Use StatefulSets for Redis and DaemonSets for Sentinel if needed.
- Example manifest: https://github.com/bitnami/charts/tree/main/bitnami/redis

## Super TMA Bridge
- Deploy multiple bridge pods in each region (Kubernetes Deployment).
- Use a global load balancer (e.g., Cloud DNS, GSLB) to route traffic.
- Use persistent volumes for logs and state.

## Disaster Recovery
- Regularly back up mappings, logs, and Redis state (see backup.sh).
- Test restore procedures in a staging environment.
- Use health checks and readiness probes for self-healing.

## Example: Bitnami Redis Helm Chart
```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install redis bitnami/redis --set architecture=replication,sentinel.enabled=true
```

--- 