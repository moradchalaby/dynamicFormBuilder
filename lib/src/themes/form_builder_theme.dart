import 'package:flutter/material.dart';

class FormBuilderTheme {
  final InputDecoration? inputDecoration;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final ButtonStyle? buttonStyle;
  final double spacing;
  final EdgeInsets padding;
  final Color? primaryColor;
  final Color? backgroundColor;

  const FormBuilderTheme({
    this.inputDecoration,
    this.labelStyle,
    this.errorStyle,
    this.buttonStyle,
    this.spacing = 16.0,
    this.padding = const EdgeInsets.all(16.0),
    this.primaryColor,
    this.backgroundColor,
  });
} 