# REChain External Service Integrations

This document provides comprehensive setup instructions for integrating external services into the REChain Flutter application.

## Overview

The REChain app integrates with the following external services:

- **Grafana** - Monitoring and visualization dashboards
- **Prometheus** - Metrics collection and monitoring
- **Sourcecraft** - Code quality and development analytics
- **Gigachat** - AI-powered chat and analysis
- **Gigacode** - AI-powered code generation and analysis
- **GitHub** - Repository management and development insights

## Architecture

The integration system consists of:

1. **Service Classes** - Individual service implementations in `lib/features/`
2. **Integration Manager** - Central coordinator in `lib/features/integration/integration_manager.dart`
3. **UI Dashboard** - User interface in `lib/pages/integration/integration_dashboard.dart`
4. **Configuration** - Settings management in `lib/config/integration_config.dart`

## Setup Instructions

### 1. Environment Configuration

Create a `.env` file in your project root or configure environment variables:

```bash
# Prometheus Configuration
PROMETHEUS_BASE_URL=https://your-prometheus-instance.com
PROMETHEUS_API_KEY=your-prometheus-api-key

# Grafana Configuration
GRAFANA_BASE_URL=https://your-grafana-instance.com
GRAFANA_API_KEY=your-grafana-api-key

# Gigachat Configuration
GIGACHAT_BASE_URL=https://your-gigachat-instance.com
GIGACHAT_API_KEY=your-gigachat-api-key

# Gigacode Configuration
GIGACODE_BASE_URL=https://your-gigacode-instance.com
GIGACODE_API_KEY=your-gigacode-api-key

# Sourcecraft Configuration
SOURCECRAFT_BASE_URL=https://your-sourcecraft-instance.com
SOURCECRAFT_API_KEY=your-sourcecraft-api-key

# GitHub Configuration
GITHUB_API_KEY=your-github-personal-access-token

# Feature Flags
ENABLE_PROMETHEUS=true
ENABLE_GRAFANA=true
ENABLE_GIGACHAT=true
ENABLE_GIGACODE=true
ENABLE_SOURCECRAFT=true
ENABLE_GITHUB=true

# Default Configuration
DEFAULT_REPOSITORY=your-org/your-repo
DEFAULT_APP_NAME=rechain
```

### 2. Service-Specific Setup

#### Prometheus Setup

1. **Install Prometheus**:
   ```bash
   # Using Docker
   docker run -d \
     --name prometheus \
     -p 9090:9090 \
     -v /path/to/prometheus.yml:/etc/prometheus/prometheus.yml \
     prom/prometheus
   ```

2. **Configure prometheus.yml**:
   ```yaml
   global:
     scrape_interval: 15s
   
   scrape_configs:
     - job_name: 'rechain-app'
       static_configs:
         - targets: ['localhost:8080']
       metrics_path: '/metrics'
   ```

3. **Generate API Key**:
   - Access Prometheus UI at `http://localhost:9090`
   - Go to Configuration > API Keys
   - Create a new API key with appropriate permissions

#### Grafana Setup

1. **Install Grafana**:
   ```bash
   # Using Docker
   docker run -d \
     --name grafana \
     -p 3000:3000 \
     grafana/grafana
   ```

2. **Initial Setup**:
   - Access Grafana at `http://localhost:3000`
   - Default credentials: admin/admin
   - Add Prometheus as a data source

3. **Generate API Key**:
   - Go to Configuration > API Keys
   - Create a new API key with Admin role

#### Sourcecraft Setup

1. **Install Sourcecraft**:
   ```bash
   # Using Docker
   docker run -d \
     --name sourcecraft \
     -p 8080:8080 \
     sourcecraft/sourcecraft
   ```

2. **Configure Repository**:
   - Add your repository to Sourcecraft
   - Configure code quality rules
   - Set up development analytics

3. **Generate API Key**:
   - Access Sourcecraft API documentation
   - Create a new API key with appropriate permissions

#### Gigachat Setup

1. **Access Gigachat**:
   - Sign up for Gigachat service
   - Configure your AI model preferences
   - Set up conversation contexts

2. **Generate API Key**:
   - Go to API Management
   - Create a new API key
   - Configure rate limits and permissions

#### Gigacode Setup

1. **Access Gigacode**:
   - Sign up for Gigacode service
   - Configure code generation preferences
   - Set up supported languages and frameworks

2. **Generate API Key**:
   - Go to API Management
   - Create a new API key
   - Configure usage limits

#### GitHub Setup

1. **Create Personal Access Token**:
   - Go to GitHub Settings > Developer settings > Personal access tokens
   - Generate a new token with appropriate scopes:
     - `repo` - Full control of private repositories
     - `read:org` - Read organization data
     - `read:user` - Read user data

2. **Configure Repository Access**:
   - Ensure the token has access to your target repositories
   - Set up webhooks if needed for real-time updates

### 3. Flutter Configuration

#### Update pubspec.yaml

Ensure you have the required dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  fl_chart: ^0.66.2
  # ... other dependencies
```

#### Configure Build Variants

For different environments, create build configurations:

```bash
# Development
flutter run --dart-define=PROMETHEUS_BASE_URL=http://localhost:9090 \
           --dart-define=GRAFANA_BASE_URL=http://localhost:3000

# Production
flutter run --dart-define=PROMETHEUS_BASE_URL=https://prometheus.prod.com \
           --dart-define=GRAFANA_BASE_URL=https://grafana.prod.com
```

### 4. Usage

#### Accessing the Integration Dashboard

1. Open the REChain app
2. Navigate to the Dashboard
3. Tap on the "Integrations" tab
4. Select any integration card to view detailed information

#### Programmatic Usage

```dart
import 'package:rechain/features/integration/integration_manager.dart';

// Initialize the integration manager
final integrationManager = IntegrationManager(
  prometheusService: PrometheusService(
    baseUrl: 'https://your-prometheus.com',
    apiKey: 'your-api-key',
  ),
  // ... other services
);

// Get system health overview
final health = await integrationManager.getSystemHealthOverview();

// Get development insights
final insights = await integrationManager.getBlockchainDevelopmentInsights(
  repository: 'your-org/your-repo',
);

// Generate smart contract with AI
final contract = await integrationManager.generateSmartContract(
  description: 'ERC-20 token contract',
  blockchain: 'ethereum',
  language: 'solidity',
);
```

## Features

### System Health Monitoring

- Real-time CPU, memory, and disk usage
- Application performance metrics
- Service availability status
- Historical trend analysis

### Development Analytics

- GitHub activity tracking
- Code quality metrics
- Development velocity analysis
- Team productivity insights

### AI-Powered Development

- Code analysis and suggestions
- Smart contract generation
- Code explanation and documentation
- Security vulnerability detection

### Monitoring Dashboards

- Grafana dashboard integration
- Custom metric visualization
- Alert configuration
- Performance trend analysis

## Troubleshooting

### Common Issues

1. **API Key Authentication Errors**:
   - Verify API keys are correctly configured
   - Check service endpoints are accessible
   - Ensure proper permissions are set

2. **Service Connection Issues**:
   - Verify network connectivity
   - Check firewall settings
   - Validate service URLs

3. **Data Loading Failures**:
   - Check service availability
   - Verify data format compatibility
   - Review error logs

### Debug Mode

Enable debug logging by setting:

```dart
// In your main.dart or configuration
const bool enableDebugLogging = true;
```

### Error Handling

The integration system includes comprehensive error handling:

- Graceful degradation when services are unavailable
- Retry mechanisms for transient failures
- User-friendly error messages
- Fallback to cached data when possible

## Security Considerations

1. **API Key Management**:
   - Store API keys securely
   - Use environment variables
   - Rotate keys regularly
   - Implement proper access controls

2. **Data Privacy**:
   - Minimize data collection
   - Implement data encryption
   - Follow GDPR compliance
   - Secure data transmission

3. **Access Control**:
   - Implement user authentication
   - Use role-based access control
   - Audit access logs
   - Monitor for suspicious activity

## Performance Optimization

1. **Caching Strategy**:
   - Cache frequently accessed data
   - Implement cache invalidation
   - Use appropriate cache TTL

2. **Request Optimization**:
   - Batch API requests
   - Implement request throttling
   - Use connection pooling

3. **UI Performance**:
   - Lazy load data
   - Implement pagination
   - Use efficient data structures

## Monitoring and Maintenance

### Health Checks

Implement regular health checks for all services:

```dart
// Check service health
final health = await integrationManager.getSystemHealthOverview();
if (!health.services['prometheus']!) {
  // Handle Prometheus unavailability
}
```

### Metrics Collection

Monitor integration performance:

- API response times
- Error rates
- Data freshness
- User engagement

### Regular Maintenance

- Update API keys regularly
- Monitor service deprecations
- Review and update configurations
- Backup integration settings

## Support

For issues and questions:

1. Check the troubleshooting section
2. Review service-specific documentation
3. Contact the development team
4. Submit issues through GitHub

## Contributing

To contribute to the integration system:

1. Follow the existing code structure
2. Add comprehensive tests
3. Update documentation
4. Follow security best practices
5. Submit pull requests for review

## Aurora OS Integration

REChain supports Aurora OS (Sailfish/Aurora) via the flutter-aurora toolchain.

### Toolchain Setup
- Clone and set up flutter-aurora: https://gitlab.com/omprussia/flutter/flutter.git
- Add flutter-aurora's bin directory to your PATH

### Building for Aurora OS
```sh
flutter-aurora pub get
flutter-aurora build aurora
```

### Project Structure
- `aurora/` — CMake, main.cpp, icons, desktop files, RPM spec
- `REChainPWAForAuroraOS/` — PWA and QML integration (if needed)

### Platform Notes
- Some plugins may require extra permissions or tweaks for Aurora OS
- Test on a real device or emulator
- For packaging, see `aurora/rpm/com.rechain.online.spec` 