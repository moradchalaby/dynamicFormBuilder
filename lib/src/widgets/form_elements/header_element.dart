import 'package:flutter/material.dart';

class FormHeaderElement extends StatelessWidget {
  final Map<String, dynamic> fieldData;

  const FormHeaderElement({
    super.key,
    required this.fieldData,
  });

  @override
  Widget build(BuildContext context) {
    Widget headerWidget;
    switch (fieldData['subtype']) {
      case 'h1':
        headerWidget = Text(
          fieldData['label'],
          style: Theme.of(context).textTheme.headlineLarge,
        );
        break;
      case 'h2':
        headerWidget = Text(
          fieldData['label'],
          style: Theme.of(context).textTheme.headlineMedium,
        );
        break;
      case 'h3':
        headerWidget = Text(
          fieldData['label'],
          style: Theme.of(context).textTheme.headlineSmall,
        );
        break;
      default:
        headerWidget = Text(
          fieldData['label'],
          style: Theme.of(context).textTheme.titleLarge,
        );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: headerWidget,
    );
  }
} 