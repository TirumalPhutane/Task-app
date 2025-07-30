import 'package:demo/network_api/model/new_response.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  Future<NewResponse> _uploadFileFuture = Future.value(
    const NewResponse(data: null, error: ''),
  );
  final DataService _service = locator();

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(withData: true);

    if (result != null && result.files.single.bytes != null) {
      final fileBytes = result.files.single.bytes!;
      final fileName = result.files.single.name;

      setState(() {
        _uploadFileFuture = _service.uploadFile(fileBytes, fileName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File upload'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _selectFile,
              child: const Text('Upload File'),
            ),
            const SizedBox(height: 20),
            FutureBuilder<NewResponse>(
              future: _uploadFileFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final response = snapshot.data!;
                  if (response.error.isNotEmpty) {
                    return Text('Server Error: ${response.error}');
                  } else {
                    return Text('Upload Successful: ${response.data}');
                  }
                } else {
                  return const Text('Something went wrong.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
