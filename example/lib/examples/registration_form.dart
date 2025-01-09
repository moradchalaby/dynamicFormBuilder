import 'package:json_form_builder/src/form_builder.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatelessWidget {
  final formData = [
    {
      "type": "text",
      "required": true,
      "label": "Ad Soyad",
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
      "description": "asdfsdf",
      "className": "form-control",
      "name": "email",
      "access": false
    },
    {
      "type": "text",
      "subtype": "password",
      "required": true,
      "label": "Şifre",
      "description": "asdfsdf",
      "className": "form-control",
      "name": "password",
      "access": false
    },
    {
      "type": "text",
      "subtype": "color",
      "required": true,
      "label": "Renk Seçin",
      "description": "Tercih ettiğiniz rengi seçin",
      "name": "color",
      "className": "form-control",
      "access": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form Builder'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: json_form_builder(
            locale: const Locale('ru'),
            formData: formData, // formData'nın ilk elemanını kullan
            onSubmit: (values) {
              // Form değerlerini göster
              print('Form değerleri:');
              values.forEach((key, value) {
                print('$key: $value');
              });
            }) as Widget,
      ),
    );
  }
}
