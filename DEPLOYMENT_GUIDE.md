# Deployment Guide for REChain

This guide provides step-by-step instructions for deploying REChain in various environments.

## Prerequisites

- Flutter SDK 3.32.8 or higher
- Git
- Docker (optional)
- Kubernetes (for production deployments)

## Local Development Deployment

### 1. Clone the Repository
```bash
git clone https://github.com/sorydima/REChain-.git
cd REChain-
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Environment
```bash
cp config.sample.json config.json
# Edit config.json with your settings
```

### 4. Run Locally
```bash
flutter run
```

## Production Deployment

### Docker Deployment

#### Build Docker Image
```bash
docker build -t rechain:latest .
```

#### Run Container
```bash
docker run -p 8080:8080 rechain:latest
```

### Kubernetes Deployment

#### Apply Manifests
```bash
kubectl apply -f k8s/
```

#### Check Status
```bash
kubectl get pods
kubectl get services
```

## Cloud Deployments

### AWS

#### Using Elastic Beanstalk
```bash
eb init rechain
eb create production-env
```

#### Using ECS
```bash
aws ecs create-cluster --cluster-name rechain-cluster
aws ecs create-service --cluster rechain-cluster --service-name rechain-service --task-definition rechain-task
```

### Google Cloud

#### Using App Engine
```bash
gcloud app deploy
```

#### Using Cloud Run
```bash
gcloud run deploy --source .
```

### Azure

#### Using App Service
```bash
az webapp up --name rechain --runtime "DOTNET|6.0"
```

## Platform-Specific Deployments

### Android
```bash
flutter build apk --release
# Upload to Google Play Store
```

### iOS
```bash
flutter build ios --release
# Upload to App Store Connect
```

### Web
```bash
flutter build web --release
# Deploy to web server or CDN
```

### Linux
```bash
flutter build linux --release
# Package and distribute
```

### Windows
```bash
flutter build windows --release
# Package installer
```

## Configuration

### Environment Variables
```bash
export MATRIX_HOMESERVER_URL=https://matrix.org
export IPFS_GATEWAY_URL=https://ipfs.io
export BLOCKCHAIN_RPC_URL=https://mainnet.infura.io/v3/YOUR_PROJECT_ID
```

### Database Configuration
```json
{
  "database": {
    "host": "localhost",
    "port": 5432,
    "database": "rechain",
    "username": "rechain_user",
    "password": "secure_password"
  }
}
```

## Monitoring and Logging

### Enable Logging
```bash
export LOG_LEVEL=info
export LOG_FILE=/var/log/rechain.log
```

### Health Checks
```bash
curl http://localhost:8080/health
```

## Scaling

### Horizontal Scaling
```bash
kubectl scale deployment rechain --replicas=5
```

### Load Balancing
Configure load balancer to distribute traffic across instances.

## Backup and Recovery

### Database Backup
```bash
pg_dump rechain > rechain_backup.sql
```

### File Storage Backup
```bash
# Backup IPFS data
ipfs files ls > ipfs_backup.txt
```

## Troubleshooting

See TROUBLESHOOTING.md for common deployment issues.

---

*This deployment guide is part of the REChain documentation suite.*
