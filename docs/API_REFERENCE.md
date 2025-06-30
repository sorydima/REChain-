# API Reference

## Overview
- Unified REST API for all bridge, plugin, admin, and REChain features
- See [openapi.yaml](../bridges/telegram_super_tma/openapi.yaml) for full spec

## Usage Examples

### Dart (HTTP)
```dart
final response = await http.get(Uri.parse('http://localhost:8082/api/health'));
print(response.body);
```

### Python (requests)
```python
import requests
r = requests.get('http://localhost:8082/api/metrics')
print(r.json())
```

### REST (curl)
```sh
curl http://localhost:8082/api/plugins
```

## Authentication
- OAuth2/SSO and RBAC required for most endpoints

## OpenAPI/Swagger
- [openapi.yaml](../bridges/telegram_super_tma/openapi.yaml)
- Use Swagger UI or Redoc to explore and test the API

--- 