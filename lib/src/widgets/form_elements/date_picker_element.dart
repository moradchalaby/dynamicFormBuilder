import 'package:json_form_builder/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormDatePickerElement extends StatefulWidget {
  final Map<String, dynamic> fieldData;
  final Function(String?) onChanged;

  const FormDatePickerElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  State<FormDatePickerElement> createState() => _FormDatePickerElementState();
}

class _FormDatePickerElementState extends State<FormDatePickerElement> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.fieldData['value'] != null) {
      selectedDate = DateTime.parse(widget.fieldData['value']);
      _controller.text = selectedDate!.toLocal().toString().split(' ')[0];
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final firstDate = widget.fieldData['min'] != null
        ? DateTime.now()
            .add(Duration(days: int.parse(widget.fieldData['min'].toString())))
        : DateTime(1900);

    final initialDate = selectedDate ?? DateTime.now();
    final adjustedInitialDate =
        initialDate.isBefore(firstDate) ? firstDate : initialDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: adjustedInitialDate,
      firstDate: firstDate,
      lastDate: widget.fieldData['max'] != null
          ? DateTime.now().add(
              Duration(days: int.parse(widget.fieldData['max'].toString())))
          : DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      widget.onChanged(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: widget.fieldData['label'],
          hintText: widget.fieldData['placeholder'],
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
          border: const OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () => _selectDate(context),
        validator: widget.fieldData['required'] == true
            ? (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).fieldRequired;
                }
                return null;
              }
            : null,
      ),
    );
  }
}
