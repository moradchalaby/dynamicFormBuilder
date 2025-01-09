import 'package:flutter/material.dart';

class FormParagraphElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;

  const FormParagraphElement({
    super.key,
    required this.fieldData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        fieldData['label'],
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
} 