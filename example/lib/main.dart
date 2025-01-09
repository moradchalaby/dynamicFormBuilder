import 'package:json_form_builder_example/examples/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:json_form_builder/json_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Builder Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Test için örnek form verisi
    final formData = [
      [
        {
          "type": "autocomplete",
          "required": false,
          "label": "Autocomplete",
          "className": "form-control",
          "name": "autocomplete-1736326641537-0",
          "access": false,
          "requireValidOption": false,
          "values": [
            {"label": "Option 1", "value": "option-1", "selected": true},
            {"label": "Option 2", "value": "option-2", "selected": false},
            {"label": "Option 3", "value": "option-3", "selected": false}
          ]
        },
        {
          "type": "button",
          "label": "Button",
          "subtype": "button",
          "className": "btn-default btn",
          "name": "button-1736326642737-0",
          "access": false,
          "style": "default"
        },
        {
          "type": "checkbox-group",
          "required": false,
          "label": "Checkbox Group",
          "toggle": false,
          "inline": false,
          "name": "checkbox-group-1736326644082-0",
          "access": false,
          "other": false,
          "values": [
            {"label": "Option 1", "value": "option-1", "selected": true}
          ]
        },
        {
          "type": "date",
          "required": false,
          "label": "Date Field",
          "description": "dsdf",
          "placeholder": "asd",
          "className": "form-control",
          "name": "date-1736326645094-0",
          "access": false,
          "value": "2025-01-05",
          "subtype": "date",
          "min": "2",
          "max": "43",
          "step": "23"
        },
        {
          "type": "file",
          "required": false,
          "label": "File Upload",
          "description": "sd",
          "placeholder": "sdf",
          "className": "form-control",
          "name": "file-1736326646118-0",
          "access": false,
          "multiple": false
        },
        {
          "type": "file",
          "required": true,
          "label": "File Upload",
          "description": "sdaf",
          "placeholder": "asdf",
          "className": "form-control",
          "name": "file-1736326704727-0",
          "access": false,
          "multiple": true
        },
        {"type": "header", "subtype": "h1", "label": "Header", "access": false},
        {"type": "hidden", "name": "hidden-1736326649506-0", "access": false},
        {
          "type": "number",
          "required": false,
          "label": "Number",
          "description": "asdf",
          "placeholder": "adsf",
          "className": "form-control",
          "name": "number-1736326650749-0",
          "access": false,
          "value": "2323",
          "subtype": "number",
          "min": 23,
          "max": 43444,
          "step": 32
        },
        {
          "type": "paragraph",
          "subtype": "p",
          "label": "Paragraph",
          "access": false
        },
        {
          "type": "radio-group",
          "required": false,
          "label": "Radio Group",
          "description": "asdf",
          "inline": true,
          "name": "radio-group-1736326655331-0",
          "access": false,
          "other": true,
          "values": [
            {"label": "Option 1", "value": "option-1", "selected": false},
            {"label": "Option 2", "value": "option-2", "selected": false},
            {"label": "Option 3", "value": "option-3", "selected": false}
          ]
        },
        {
          "type": "radio-group",
          "required": false,
          "label": "Radio Group",
          "inline": false,
          "name": "radio-group-1736326657234-0",
          "access": false,
          "other": false,
          "values": [
            {"label": "Option 1", "value": "option-1", "selected": false},
            {"label": "Option 2", "value": "option-2", "selected": false},
            {"label": "Option 3", "value": "option-3", "selected": false}
          ]
        },
        {
          "type": "select",
          "required": false,
          "label": "Select",
          "className": "form-control",
          "name": "select-1736326658774-0",
          "access": false,
          "multiple": false,
          "values": [
            {"label": "Option 1", "value": "option-1", "selected": true},
            {"label": "Option 2", "value": "option-2", "selected": false},
            {"label": "Option 3", "value": "option-3", "selected": false}
          ]
        },
        {
          "type": "text",
          "required": false,
          "label": "Text Field",
          "className": "form-control",
          "name": "text-1736326661890-0",
          "access": false,
          "subtype": "text"
        },
        {
          "type": "textarea",
          "required": false,
          "label": "Text Area",
          "className": "form-control",
          "name": "textarea-1736326663192-0",
          "access": false,
          "subtype": "textarea"
        }
      ]
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Builder Demo'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegistrationForm()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: json_form_builder(
          formData: formData[0], // formData'nın ilk elemanını kullan
          onSubmit: (values) {
            // Form değerlerini göster
            print('Form değerleri:');
            values.forEach((key, value) {
              print('$key: $value');
            });

            // Başarılı mesajı göster
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Form başarıyla gönderildi!'),
                backgroundColor: Colors.green,
              ),
            );
          },
          locale: const Locale('tr'),
        ),
      ),
    );
  }
}
