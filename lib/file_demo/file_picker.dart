import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  String? _fileName;
  String? _fileSize;
  String? _fileExtension;
  String? _filePath;
  String? _selectedDirectory;

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = result.files.first;

      setState(() {
        _fileName = file.name;
        _fileSize = convertByteToMB(file.size).toStringAsFixed(2);
        _fileExtension = file.extension;
        _filePath = file.path;
      });
    }
  }

  Future<void> _selectDirectory() async {
    final selectedPath = await FilePicker.platform.getDirectoryPath();

    setState(() {
      _selectedDirectory = selectedPath;
    });
  }

  double convertByteToMB(int size) {
    return size / 1048576;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _selectFile,
                    label: const Text('Pick File'),
                    icon: const Icon(Icons.attach_file),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: _selectDirectory,
                    label: const Text('Pick Folder'),
                    icon: const Icon(Icons.folder),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                _fileName != null
                    ? 'File name : $_fileName\n'
                          'Size : $_fileSize MB\n'
                          'File Extension : $_fileExtension\n'
                          'File Path : $_filePath'
                    : 'No file selected yet',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                _selectedDirectory ?? 'No directory selected yet',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
