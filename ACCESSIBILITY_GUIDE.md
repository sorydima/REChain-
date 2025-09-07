# Accessibility Guide for REChain

This guide provides guidelines for ensuring REChain is accessible to all users.

## Principles

- **Perceivable**: Information must be presentable in ways users can perceive
- **Operable**: Interface elements must be operable by all users
- **Understandable**: Information and operation must be understandable
- **Robust**: Content must be robust enough to work with assistive technologies

## Implementation

### Semantic HTML
```dart
// Use semantic widgets
Semantics(
  label: 'Login button',
  hint: 'Tap to log into your account',
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Login'),
  ),
)
```

### Color Contrast
- Ensure minimum contrast ratio of 4.5:1 for normal text
- 3:1 for large text
- Use tools to check contrast

### Focus Management
```dart
// Manage focus order
FocusNode loginFocus = FocusNode();

TextField(
  focusNode: loginFocus,
  decoration: InputDecoration(
    labelText: 'Username',
  ),
)

// Move focus programmatically
loginFocus.requestFocus();
```

### Screen Reader Support
```dart
// Provide screen reader announcements
Semantics(
  liveRegion: true,
  child: Text('Message sent successfully'),
)

// Exclude decorative elements
Semantics(
  excludeSemantics: true,
  child: DecorativeImage(),
)
```

## Testing Accessibility

### Automated Testing
```dart
// Use accessibility checker
import 'package:flutter_test/flutter_test.dart';

testWidgets('Login button is accessible', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());

  final button = find.byType(ElevatedButton);
  final semantics = tester.getSemantics(button);

  expect(semantics.label, 'Login');
  expect(semantics.hint, isNotNull);
});
```

### Manual Testing
- Test with screen readers (TalkBack, VoiceOver)
- Test keyboard navigation
- Test with high contrast mode
- Test with large text settings

## Best Practices

### Text and Typography
- Use readable font sizes (minimum 14pt)
- Provide sufficient line spacing
- Avoid justified text
- Use clear, simple language

### Images and Media
```dart
// Provide alt text for images
Image.asset(
  'logo.png',
  semanticLabel: 'REChain logo',
)
```

### Forms
- Associate labels with inputs
- Provide clear error messages
- Use appropriate input types

### Navigation
- Provide clear navigation structure
- Use headings hierarchy
- Include skip links for screen readers

## Tools and Resources

- Flutter Accessibility Tools
- Android Accessibility Scanner
- iOS Accessibility Inspector
- WebAIM guidelines
- WCAG 2.1 standards

## Compliance

REChain aims to comply with:
- WCAG 2.1 AA standards
- Section 508 (US)
- EN 301 549 (EU)

## Contributing

- Test accessibility changes
- Include accessibility in PR reviews
- Document accessibility features
- Follow established patterns

---

*This accessibility guide is part of the REChain documentation suite.*
