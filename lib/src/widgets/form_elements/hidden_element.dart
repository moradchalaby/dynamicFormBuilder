import 'package:flutter/material.dart';

class FormHiddenElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;
  final Function(String) onChanged;

  const FormHiddenElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Hidden field değerini form state'e ekle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChanged(fieldData['value'] ?? '');
    });
    
    // Görünür bir widget döndürme
    return const SizedBox.shrink();
  }
} 