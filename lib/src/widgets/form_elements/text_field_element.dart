import 'package:dynamic_form_builder/src/localization/app_localizations.dart';
import 'package:dynamic_form_builder/src/widgets/form_elements/color_picker_element.dart';
import 'package:flutter/material.dart';

class TextFieldElement extends StatelessWidget {
  final Map<String, dynamic> field;
  final Function(String) onChanged;

  const TextFieldElement({
    Key? key,
    required this.field,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (field['subtype'] == 'color') {
      return ColorPickerElement(
        field: field,
        onChanged: onChanged,
      );
    }

    return TextFormField(
      decoration: InputDecoration(
        labelText: field['label'],
        helperText: field['description'],
      ),
      keyboardType: _getKeyboardType(),
      obscureText: field['subtype'] == 'password',
      onChanged: onChanged,
      validator: (value) {
        if (field['required'] == true && (value == null || value.isEmpty)) {
          return AppLocalizations.of(context).fieldRequired;

        }
        return null;
      },
    );
  }

  TextInputType _getKeyboardType() {
    switch (field['subtype']) {
      case 'email':
        return TextInputType.emailAddress;
      case 'tel':
        return TextInputType.phone;
      case 'number':
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }
}
