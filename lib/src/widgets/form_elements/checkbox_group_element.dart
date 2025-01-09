import 'package:flutter/material.dart';

class FormCheckboxGroupElement extends StatefulWidget {
  final Map<String, dynamic> fieldData;
  final Function(List<String>) onChanged;

  const FormCheckboxGroupElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  State<FormCheckboxGroupElement> createState() => _FormCheckboxGroupElementState();
}

class _FormCheckboxGroupElementState extends State<FormCheckboxGroupElement> {
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> values = 
        List<Map<String, dynamic>>.from(widget.fieldData['values']);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldData['label'],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ...values.map((value) {
            return CheckboxListTile(
              title: Text(value['label']),
              value: selectedValues.contains(value['value']),
              onChanged: (bool? checked) {
                setState(() {
                  if (checked == true) {
                    selectedValues.add(value['value']);
                  } else {
                    selectedValues.remove(value['value']);
                  }
                });
                widget.onChanged(selectedValues);
              },
            );
          }),
        ],
      ),
    );
  }
} 