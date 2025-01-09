import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localizations.dart';
import 'widgets/form_elements/text_field_element.dart';
import 'widgets/form_elements/select_element.dart';
import 'widgets/form_elements/checkbox_group_element.dart';
import 'widgets/form_elements/radio_group_element.dart';
import 'widgets/form_elements/date_picker_element.dart';
import 'widgets/form_elements/file_upload_element.dart';
import 'widgets/form_elements/number_input_element.dart';
import 'widgets/form_elements/textarea_element.dart';
import 'widgets/form_elements/autocomplete_element.dart';
import 'widgets/form_elements/button_element.dart';
import 'widgets/form_elements/header_element.dart';
import 'widgets/form_elements/hidden_element.dart';
import 'widgets/form_elements/paragraph_element.dart';

class json_form_builder extends StatefulWidget {
  final List<Map<String, dynamic>> formData;
  final Function(Map<String, dynamic>) onSubmit;
  final Locale locale;

  const json_form_builder({
    super.key,
    required this.formData,
    required this.onSubmit,
    this.locale = const Locale('en'),
  });

  @override
  State<json_form_builder> createState() => _json_form_builderState();
}

class _json_form_builderState extends State<json_form_builder> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formValues = {};

  Object _buildFormField(Map<String, dynamic> fieldData) {
    switch (fieldData['type']) {
      case 'text':
        return TextFieldElement(
          field: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'select':
        return FormSelectElement(
          fieldData: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'checkbox-group':
        return FormCheckboxGroupElement(
          fieldData: fieldData,
          onChanged: (values) {
            _formValues[fieldData['name']] = values;
          },
        );
      case 'radio-group':
        return FormRadioGroupElement(
          fieldData: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'date':
        return FormDatePickerElement(
          fieldData: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'file':
        return FormFileUploadElement(
          fieldData: fieldData,
          onChanged: (files) {
            _formValues[fieldData['name']] = files;
          },
        );
      case 'number':
        return FormNumberInputElement(
          fieldData: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'textarea':
        return FormTextAreaElement(
          fieldData: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'autocomplete':
        return FormAutocompleteElement(
          fieldData: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'button':
        return FormButtonElement(
          fieldData: fieldData,
          onPressed: () {
            // Button action
          },
        );
      case 'header':
        return FormHeaderElement(
          fieldData: fieldData,
        );
      case 'hidden':
        return FormHiddenElement(
          fieldData: fieldData,
          onChanged: (value) {
            _formValues[fieldData['name']] = value;
          },
        );
      case 'paragraph':
        return FormParagraphElement(
          fieldData: fieldData,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: widget.locale,
      delegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      child: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.formData.length,
                itemBuilder: (context, index) {
                  return _buildFormField(widget.formData[index]) as Widget;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.onSubmit(_formValues);
                  }
                },
                child: Text(AppLocalizations.of(context).submit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
