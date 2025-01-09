import 'package:flutter/material.dart';

class FormRadioGroupElement extends StatefulWidget {
  final Map<String, dynamic> fieldData;
  final Function(String?) onChanged;

  const FormRadioGroupElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  State<FormRadioGroupElement> createState() => _FormRadioGroupElementState();
}

class _FormRadioGroupElementState extends State<FormRadioGroupElement> {
  String? selectedValue;
  TextEditingController? _otherController;

  @override
  void initState() {
    super.initState();
    if (widget.fieldData['other'] == true) {
      _otherController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _otherController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> values = 
        List<Map<String, dynamic>>.from(widget.fieldData['values']);
    final bool isInline = widget.fieldData['inline'] ?? false;
    final bool hasOther = widget.fieldData['other'] ?? false;

    Widget buildRadioList() {
      return Column(
        children: [
          ...values.map((value) {
            return RadioListTile<String>(
              title: Text(value['label']),
              value: value['value'],
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged(value);
              },
            );
          }),
          if (hasOther) ...[
            RadioListTile<String>(
              title: Row(
                children: [
                  const Text('Diğer: '),
                  Expanded(
                    child: TextField(
                      controller: _otherController,
                      onChanged: (value) {
                        if (selectedValue == 'other') {
                          widget.onChanged('other:$value');
                        }
                      },
                      enabled: selectedValue == 'other',
                    ),
                  ),
                ],
              ),
              value: 'other',
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
                if (value == 'other') {
                  widget.onChanged('other:${_otherController?.text}');
                }
              },
            ),
          ],
        ],
      );
    }

    Widget buildInlineRadioList() {
      return Wrap(
        spacing: 8.0,
        children: [
          ...values.map((value) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: value['value'],
                  groupValue: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                    widget.onChanged(value);
                  },
                ),
                Text(value['label']),
              ],
            );
          }),
          if (hasOther)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: 'other',
                  groupValue: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                    if (value == 'other') {
                      widget.onChanged('other:${_otherController?.text}');
                    }
                  },
                ),
                const Text('Diğer: '),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _otherController,
                    onChanged: (value) {
                      if (selectedValue == 'other') {
                        widget.onChanged('other:$value');
                      }
                    },
                    enabled: selectedValue == 'other',
                  ),
                ),
              ],
            ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldData['label'],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (widget.fieldData['description'] != null)
            Text(
              widget.fieldData['description'],
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const SizedBox(height: 8),
          isInline ? buildInlineRadioList() : buildRadioList(),
        ],
      ),
    );
  }
} 