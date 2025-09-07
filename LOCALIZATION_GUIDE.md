# Localization Guide for REChain

This guide explains how to add new languages and manage translations in REChain.

## Supported Languages

- English (en)
- Russian (ru)
- Spanish (es)
- French (fr)
- German (de)
- Chinese (zh)
- Japanese (ja)
- Korean (ko)

## Adding a New Language

### 1. Create Language Files
```bash
# Create ARB file for new language
touch lib/l10n/app_en.arb
touch lib/l10n/app_es.arb  # For Spanish
```

### 2. Add Translations
```json
// lib/l10n/app_en.arb
{
  "welcomeMessage": "Welcome to REChain",
  "loginButton": "Login",
  "settings": "Settings"
}

// lib/l10n/app_es.arb
{
  "welcomeMessage": "Bienvenido a REChain",
  "loginButton": "Iniciar sesión",
  "settings": "Configuración"
}
```

### 3. Generate Localization Code
```bash
flutter pub run intl_utils:generate
```

### 4. Update MaterialApp
```dart
MaterialApp(
  localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('en', ''),
    const Locale('es', ''),
    // Add more locales
  ],
)
```

## Using Translations in Code

### Basic Usage
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Text(AppLocalizations.of(context)!.welcomeMessage)
```

### With Parameters
```json
// In ARB file
"itemCount": "You have {count} items",
"@itemCount": {
  "placeholders": {
    "count": {
      "type": "int"
    }
  }
}
```

```dart
Text(AppLocalizations.of(context)!.itemCount(5))
```

### Pluralization
```json
"itemCount": "{count, plural, =0{No items} =1{1 item} other{{count} items}}",
"@itemCount": {
  "placeholders": {
    "count": {
      "type": "int"
    }
  }
}
```

## Managing Translations

### Tools
- Flutter Intl extension for VS Code
- ARB files for translation management
- Google Translate API for initial translations

### Workflow
1. Add new strings to English ARB file
2. Generate code
3. Translate to other languages
4. Test translations
5. Commit changes

## Best Practices

### Translation Keys
- Use descriptive, camelCase keys
- Group related strings
- Avoid hardcoded strings

### Context
- Provide context for translators
- Include screenshots for UI strings
- Use comments in ARB files

### Testing
- Test RTL languages
- Check text overflow
- Verify date/number formatting

## Advanced Features

### Dynamic Loading
```dart
// Load translations dynamically
final locale = Localizations.localeOf(context);
final localizations = await AppLocalizations.load(locale);
```

### Custom Localizations
```dart
class CustomLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    // Custom loading logic
  }
}
```

## Troubleshooting

### Common Issues
- Missing translations
- Incorrect plural forms
- Text overflow in UI

### Debugging
```dart
// Check current locale
print(Localizations.localeOf(context));

// Force locale for testing
MaterialApp(
  locale: const Locale('es'),
  // ...
)
```

## Contributing

- Follow translation guidelines
- Test changes in multiple languages
- Update documentation

---

*This localization guide is part of the REChain documentation suite.*
