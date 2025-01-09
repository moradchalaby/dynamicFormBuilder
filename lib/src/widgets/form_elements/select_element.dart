import 'package:json_form_builder/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class FormSelectElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;
  final Function(String?) onChanged;

  const FormSelectElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> values =
        List<Map<String, dynamic>>.from(fieldData['values']);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: fieldData['label'],
          border: const OutlineInputBorder(),
        ),
        items: values.map((value) {
          return DropdownMenuItem<String>(
            value: value['value'],
            child: Text(value['label']),
          );
        }).toList(),
        onChanged: onChanged,
        validator: fieldData['required'] == true
            ? (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).fieldRequired;
                }
                return null;
              }
            : null,
      ),
    );
  }
}
