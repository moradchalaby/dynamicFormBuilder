import 'package:flutter/material.dart';
import 'package:json_form_builder/form_builder.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String lang = 'en'; // Varsayılan dil

  final formData = [
    {
      "type": "text",
      "required": true,
      "label": "Name",
      "name": "fullname",
      "className": "form-control",
      "access": false,
      "subtype": "text"
    },
    {
      "type": "text",
      "subtype": "email",
      "required": true,
      "label": "Email",
      "description": "Email",
      "className": "form-control",
      "name": "email",
      "access": false
    },
    {
      "type": "text",
      "subtype": "password",
      "required": true,
      "label": "Password",
      "description": "Password",
      "className": "form-control",
      "name": "password",
      "access": false
    },
    {
      "type": "text",
      "subtype": "color",
      "required": true,
      "label": "Select Color",
      "description": "Select the color you want",
      "name": "color",
      "className": "form-control",
      "access": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form Builder'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _showLanguageDialog(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: JsonFormBuilder(
          locale: Locale(lang),
          formData: formData,
          onSubmit: (values) {
            print('Form values:');
            values.forEach((key, value) {
              print('$key: $value');
            });
          },
        ) as Widget,
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLanguageListTile('Türkçe', 'tr'),
                _buildLanguageListTile('English', 'en'),
                _buildLanguageListTile('Русский', 'ru'),
                _buildLanguageListTile('Français', 'fr'),
                _buildLanguageListTile('Italiano', 'it'),
                _buildLanguageListTile('Azərbaycan', 'az'),
                _buildLanguageListTile('Português', 'pt'),
                _buildLanguageListTile('العربية', 'ar'),
                _buildLanguageListTile('Deutsch', 'de'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageListTile(String title, String langCode) {
    return ListTile(
      title: Text(title),
      selected: lang == langCode,
      onTap: () {
        setState(() {
          lang = langCode;
        });
        Navigator.pop(context);
      },
    );
  }
}
