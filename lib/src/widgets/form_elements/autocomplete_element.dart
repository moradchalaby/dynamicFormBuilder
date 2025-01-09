import 'package:dynamic_form_builder/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class FormAutocompleteElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;
  final Function(String) onChanged;

  const FormAutocompleteElement({
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
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return values.map((e) => e['label'] as String).toList();
          }
          return values
              .map((e) => e['label'] as String)
              .where((option) => option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()))
              .toList();
        },
        onSelected: (String selection) {
          final selectedValue = values.firstWhere(
            (element) => element['label'] == selection,
            orElse: () => values.first,
          )['value'];
          onChanged(selectedValue);
        },
        fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
          return TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: fieldData['label'],
              border: const OutlineInputBorder(),
            ),
            validator: fieldData['required'] == true
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).fieldRequired;
                    }
                    return null;
                  }
                : null,
          );
        },
      ),
    );
  }
} 