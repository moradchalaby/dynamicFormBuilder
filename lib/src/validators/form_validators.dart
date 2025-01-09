import 'package:dynamic_form_builder/src/localization/app_localizations.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';

class FormValidators {
  static String? Function(String?) email() {
    return (value) {
      if (value == null || value.isEmpty) return null;
      if (!value.contains('@')) return AppLocalizations.of(context as BuildContext).fieldInvalidEmail;
      return null;
    };
  }

  static String? Function(String?) phone() {
    return (value) {
      if (value == null || value.isEmpty) return null;
      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
        return AppLocalizations.of(context as BuildContext).fieldInvalidPhone;
      }
      return null;
    };
  }

  static String? Function(String?) minLength(int length) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      if (value.length < length) {
        return AppLocalizations.of(context as BuildContext).fieldMin(length);
      }
      return null;
    };
  }

  static String? Function(String?) maxLength(int length) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      if (value.length > length) {
        return AppLocalizations.of(context as BuildContext).fieldMax(length);
      }
      return null;
    };
  }

  static String? Function(String?) required() {
    return (value) {
      if (value == null || value.isEmpty) return AppLocalizations.of(context as BuildContext).fieldRequired;
      return null;
    };
  }

  static String? Function(String?) min(int min) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      if (value.length < min) {
        return AppLocalizations.of(context as BuildContext).fieldMin(min);
      }
      return null;
    };
  }

  static String? Function(String?) max(int max) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      if (value.length > max) {
        return AppLocalizations.of(context as BuildContext).fieldMax(max);
      }
      return null;
    };
  }

} 