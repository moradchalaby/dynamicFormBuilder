import 'package:flutter/material.dart';

class FormButtonElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;
  final VoidCallback? onPressed;

  const FormButtonElement({
    super.key,
    required this.fieldData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getButtonColor(fieldData['style']),
        ),
        child: Text(fieldData['label']),
      ),
    );
  }

  Color _getButtonColor(String? style) {
    switch (style) {
      case 'primary':
        return Colors.blue;
      case 'success':
        return Colors.green;
      case 'danger':
        return Colors.red;
      case 'warning':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
} 