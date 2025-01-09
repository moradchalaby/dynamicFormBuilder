import 'package:json_form_builder/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class FormTextAreaElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;
  final Function(String) onChanged;

  const FormTextAreaElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: fieldData['label'],
          hintText: fieldData['placeholder'],
          border: const OutlineInputBorder(),
          alignLabelWithHint: true,
        ),
        maxLines: 5,
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
