import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColorPickerElement extends StatelessWidget {
  final Map<String, dynamic> field;
  final Function(String) onChanged;

  const ColorPickerElement({
    Key? key,
    required this.field,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<Color>(
      builder: (FormFieldState<Color> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: field['label'],
            helperText: field['description'],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  field['value'] ?? 'Renk seçiniz',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final Color? color = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(field['label'] ?? 'Renk Seç'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            borderColor: Color(int.parse(
                                field['value'] ?? 'FF000000',
                                radix: 16)),
                            onColorChanged: (Color color) {
                              String colorString =
                                  '#${color.value.toRadixString(16).padLeft(8, '0')}';
                              onChanged(colorString);
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Tamam'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                  if (color != null) {
                    String colorString =
                        '#${color.value.toRadixString(16).padLeft(8, '0')}';
                    onChanged(colorString);
                  }
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Color(int.parse(
                        field['value']?.substring(1) ?? 'FF000000',
                        radix: 16)),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
