import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FormFileUploadElement extends StatefulWidget {
  final Map<String, dynamic> fieldData;
  final Function(List<PlatformFile>) onChanged;

  const FormFileUploadElement({
    super.key,
    required this.fieldData,
    required this.onChanged,
  });

  @override
  State<FormFileUploadElement> createState() => _FormFileUploadElementState();
}

class _FormFileUploadElementState extends State<FormFileUploadElement> {
  List<PlatformFile> _selectedFiles = [];

  Future<void> _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: widget.fieldData['multiple'] ?? false,
      );

      if (result != null) {
        setState(() {
          _selectedFiles = result.files;
        });
        widget.onChanged(_selectedFiles);
      }
    } catch (e) {
      debugPrint('Error picking files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldData['label'],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _pickFiles,
            icon: const Icon(Icons.upload_file),
            label: Text(widget.fieldData['multiple'] == true 
                ? 'Dosyaları Seç'
                : 'Dosya Seç'),
          ),
          if (_selectedFiles.isNotEmpty) ...[
            const SizedBox(height: 8),
            Column(
              children: _selectedFiles.map((file) {
                return ListTile(
                  leading: const Icon(Icons.file_present),
                  title: Text(file.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _selectedFiles.remove(file);
                      });
                      widget.onChanged(_selectedFiles);
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
} 