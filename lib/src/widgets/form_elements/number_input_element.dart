import 'package:dynamic_form_builder/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNumberInputElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;
  final Function(String) onChanged;

  const FormNumberInputElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: fieldData['value']?.toString(),
        decoration: InputDecoration(
          labelText: fieldData['label'],
          hintText: fieldData['placeholder'],
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: onChanged,
        validator: (value) {
          if (fieldData['required'] == true && (value == null || value.isEmpty)) {
            return 'Bu alan zorunludur';
          }
          if (value != null && value.isNotEmpty) {
            final number = int.tryParse(value);
            if (number != null) {
              if (fieldData['min'] != null && number < fieldData['min']) {
                return AppLocalizations.of(context).fieldMin(fieldData['min']);
              }
              if (fieldData['max'] != null && number > fieldData['max']) {
                return AppLocalizations.of(context).fieldMax(fieldData['max']);
              }
            }
          }
          return null;
        },
      ),
    );
  }
} 