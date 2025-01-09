import 'package:flutter/foundation.dart';

class FormBuilderState extends ChangeNotifier {
  Map<String, dynamic> _values = {};
  Map<String, bool> _touched = {};
  bool _isSubmitting = false;
  String? _error;

  Map<String, dynamic> get values => _values;
  bool get isSubmitting => _isSubmitting;
  String? get error => _error;

  void setValue(String field, dynamic value) {
    _values[field] = value;
    _touched[field] = true;
    notifyListeners();
  }

  void reset() {
    _values = {};
    _touched = {};
    _error = null;
    notifyListeners();
  }

  Future<void> submit(Function(Map<String, dynamic>) onSubmit) async {
    try {
      _isSubmitting = true;
      notifyListeners();
      
      await onSubmit(_values);
      
      _isSubmitting = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isSubmitting = false;
      notifyListeners();
    }
  }
} 