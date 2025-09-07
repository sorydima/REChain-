# Logging Guide for REChain

This guide provides best practices for logging in the REChain application.

## Logging Principles

### What to Log
- User actions and authentication events
- System errors and exceptions
- Performance metrics and slow operations
- Security events and suspicious activities
- Business logic events

### What Not to Log
- Passwords or sensitive data
- Personal identifiable information (PII)
- Large data structures
- Debug information in production

## Logging Levels

### DEBUG
- Detailed information for debugging
- Only enabled in development

### INFO
- General information about application operation
- User actions, system events

### WARN
- Potentially harmful situations
- Deprecated API usage
- Configuration issues

### ERROR
- Error conditions that don't stop the application
- Failed operations that can be recovered

### FATAL
- Severe errors that cause application shutdown
- Unrecoverable errors

## Logging Frameworks

### Dart Logging
```dart
import 'package:logging/logging.dart';

final logger = Logger('REChain.Auth');

void setupLogging() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

void authenticateUser(String username, String password) {
  logger.info('Authenticating user: $username');

  try {
    // Authentication logic
    logger.info('User $username authenticated successfully');
  } catch (e) {
    logger.error('Authentication failed for user $username', e);
  }
}
```

### Structured Logging
```dart
logger.info('User login', {
  'user_id': userId,
  'ip_address': ipAddress,
  'user_agent': userAgent,
  'timestamp': DateTime.now().toIso8601String(),
});
```

## Log Formats

### JSON Format
```json
{
  "timestamp": "2023-01-01T12:00:00Z",
  "level": "INFO",
  "logger": "REChain.Auth",
  "message": "User authenticated",
  "user_id": "12345",
  "ip_address": "192.168.1.1"
}
```

### Plain Text Format
```
2023-01-01 12:00:00 INFO REChain.Auth - User 12345 authenticated from 192.168.1.1
```

## Log Storage

### Local Files
```dart
import 'package:logging/logging.dart';
import 'dart:io';

class FileLogger {
  final File logFile;

  FileLogger(String path) : logFile = File(path);

  void log(LogRecord record) {
    final logEntry = '${record.time}: ${record.level.name}: ${record.message}\n';
    logFile.writeAsStringSync(logEntry, mode: FileMode.append);
  }
}
```

### Remote Logging
- Use services like Sentry, LogRocket, or Papertrail
- Centralized log aggregation with ELK stack

## Log Rotation

### Automatic Rotation
```yaml
# logrotate configuration
/var/log/rechain/*.log {
  daily
  rotate 7
  compress
  missingok
  notifempty
}
```

### Size-based Rotation
```dart
class RotatingFileLogger {
  final String basePath;
  final int maxSizeBytes;
  int currentFileIndex = 0;

  RotatingFileLogger(this.basePath, this.maxSizeBytes);

  void log(String message) {
    final currentFile = File('$basePath.$currentFileIndex');
    if (currentFile.existsSync() && currentFile.lengthSync() > maxSizeBytes) {
      currentFileIndex++;
    }
    // Write to current file
  }
}
```

## Log Analysis

### Log Parsing
```python
import re

log_pattern = r'(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}) (\w+) (\w+) - (.+)'

def parse_log_line(line):
    match = re.match(log_pattern, line)
    if match:
        return {
            'timestamp': match.group(1),
            'level': match.group(2),
            'logger': match.group(3),
            'message': match.group(4)
        }
    return None
```

### Log Aggregation
- Use Elasticsearch for indexing
- Kibana for visualization
- Logstash for processing

## Security Considerations

### Log Sanitization
```dart
String sanitizeLogMessage(String message) {
  // Remove sensitive data
  message = message.replaceAll(RegExp(r'password=\w+'), 'password=***');
  message = message.replaceAll(RegExp(r'token=\w+'), 'token=***');
  return message;
}
```

### Access Control
- Restrict access to log files
- Encrypt sensitive logs
- Audit log access

## Performance Considerations

### Asynchronous Logging
```dart
import 'dart:async';

class AsyncLogger {
  final StreamController<String> _controller = StreamController();

  AsyncLogger() {
    _controller.stream.listen((message) {
      // Write to file or send to server
    });
  }

  void log(String message) {
    _controller.add(message);
  }
}
```

### Log Level Filtering
```dart
bool shouldLog(LogRecord record) {
  if (kReleaseMode && record.level < Level.INFO) {
    return false;
  }
  return true;
}
```

## Best Practices

### Consistent Formatting
- Use consistent log formats across the application
- Include relevant context in log messages

### Appropriate Levels
- Use appropriate log levels for different types of messages
- Don't use ERROR for expected conditions

### Structured Data
- Include structured data in logs for better analysis
- Use key-value pairs for searchable fields

### Monitoring
- Set up alerts for error logs
- Monitor log volume and patterns

## Tools and Libraries

- `logging` package for Dart
- `sentry` for error tracking
- ELK stack for log analysis
- Fluentd for log collection

---

*This logging guide is part of the REChain documentation suite.*
