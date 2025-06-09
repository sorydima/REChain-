import 'package:flutter/material.dart';
import '../bridge_config.dart';

class AddBridgeDialog extends StatefulWidget {
  const AddBridgeDialog({super.key});

  @override
  State<AddBridgeDialog> createState() => _AddBridgeDialogState();
}

class _AddBridgeDialogState extends State<AddBridgeDialog> {
  String? _selectedBridgeType;
  final Map<String, dynamic> _configValues = {};
  final _formKey = GlobalKey<FormState>();

  void _onBridgeTypeChanged(String? value) {
    setState(() {
      _selectedBridgeType = value;
      _configValues.clear();
      
      // Pre-fill default values
      if (value != null) {
        final template = BridgeConfigTemplate.templates[value];
        if (template != null) {
          for (final field in template.fields) {
            if (field.defaultValue != null) {
              _configValues[field.key] = field.defaultValue;
            }
          }
        }
      }
    });
  }

  Widget _buildConfigField(BridgeConfigField field) {
    switch (field.type) {
      case BridgeConfigFieldType.text:
      case BridgeConfigFieldType.password:
      case BridgeConfigFieldType.email:
      case BridgeConfigFieldType.url:
      case BridgeConfigFieldType.phone:
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.label,
            helperText: field.description,
            helperMaxLines: 2,
          ),
          initialValue: field.defaultValue,
          obscureText: field.type == BridgeConfigFieldType.password,
          keyboardType: _getKeyboardType(field.type),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return '${field.label} is required';
            }
            if (field.validation != null) {
              final pattern = field.validation!['pattern'];
              if (pattern != null && !RegExp(pattern).hasMatch(value ?? '')) {
                return field.validation!['message'] ?? 'Invalid format';
              }
            }
            return null;
          },
          onSaved: (value) {
            if (value != null && value.isNotEmpty) {
              _configValues[field.key] = value;
            }
          },
        );
      case BridgeConfigFieldType.number:
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.label,
            helperText: field.description,
            helperMaxLines: 2,
          ),
          initialValue: field.defaultValue,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return '${field.label} is required';
            }
            if (value != null && value.isNotEmpty) {
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
            }
            return null;
          },
          onSaved: (value) {
            if (value != null && value.isNotEmpty) {
              _configValues[field.key] = int.parse(value);
            }
          },
        );
      case BridgeConfigFieldType.boolean:
        return SwitchListTile(
          title: Text(field.label),
          subtitle: field.description != null ? Text(field.description!) : null,
          value: _configValues[field.key] as bool? ??
              (field.defaultValue == 'true'),
          onChanged: (value) {
            setState(() {
              _configValues[field.key] = value;
            });
          },
        );
      case BridgeConfigFieldType.select:
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: field.label,
            helperText: field.description,
            helperMaxLines: 2,
          ),
          value: _configValues[field.key] as String? ?? field.defaultValue,
          items: field.options?.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          validator: field.required
              ? (value) =>
                  value == null ? '${field.label} is required' : null
              : null,
          onChanged: (value) {
            setState(() {
              _configValues[field.key] = value;
            });
          },
        );
      case BridgeConfigFieldType.multiselect:
        final selectedValues =
            (_configValues[field.key] as List<String>?) ?? [];
        return FormField<List<String>>(
          initialValue: selectedValues,
          validator: field.required
              ? (value) => (value?.isEmpty ?? true)
                  ? '${field.label} is required'
                  : null
              : null,
          builder: (state) {
            return InputDecorator(
              decoration: InputDecoration(
                labelText: field.label,
                errorText: state.errorText,
                helperText: field.description,
                helperMaxLines: 2,
              ),
              child: Wrap(
                spacing: 8,
                children: field.options?.map((option) {
                  return FilterChip(
                    label: Text(option),
                    selected: selectedValues.contains(option),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedValues.add(option);
                        } else {
                          selectedValues.remove(option);
                        }
                        _configValues[field.key] = selectedValues;
                        state.didChange(selectedValues);
                      });
                    },
                  );
                }).toList() ?? [],
              ),
            );
          },
        );
    }
  }

  TextInputType _getKeyboardType(BridgeConfigFieldType type) {
    switch (type) {
      case BridgeConfigFieldType.email:
        return TextInputType.emailAddress;
      case BridgeConfigFieldType.url:
        return TextInputType.url;
      case BridgeConfigFieldType.phone:
        return TextInputType.phone;
      case BridgeConfigFieldType.number:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final template = _selectedBridgeType != null
        ? BridgeConfigTemplate.templates[_selectedBridgeType]
        : null;

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add New Bridge',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Bridge Type',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedBridgeType,
                  items: BridgeConfigTemplate.templates.entries.map((entry) {
                    return DropdownMenuItem(
                      value: entry.key,
                      child: Row(
                        children: [
                          Text(entry.value.icon),
                          const SizedBox(width: 8),
                          Text(entry.value.name),
                        ],
                      ),
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? 'Please select a bridge type' : null,
                  onChanged: _onBridgeTypeChanged,
                ),
                if (template != null) ...[
                  const SizedBox(height: 16),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...template.fields.map((field) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _buildConfigField(field),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('CANCEL'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          Navigator.of(context).pop({
                            'type': _selectedBridgeType,
                            'config': _configValues,
                          });
                        }
                      },
                      child: const Text('ADD BRIDGE'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
