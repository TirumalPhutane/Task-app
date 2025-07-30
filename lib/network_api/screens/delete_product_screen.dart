import 'package:demo/network_api/model/new_response.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/locator.dart';
import 'package:flutter/material.dart';

class DeleteProductScreen extends StatefulWidget {
  const DeleteProductScreen({super.key});

  @override
  State<DeleteProductScreen> createState() => _DeleteProductScreenState();
}

class _DeleteProductScreenState extends State<DeleteProductScreen> {
  final TextEditingController _idController = TextEditingController();

  Future<NewResponse>? _deleteProductFuture;
  final DataService _service = locator();

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  void _deleteProduct() {
    setState(() {
      _deleteProductFuture = _service.deleteProduct(
        int.parse(_idController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Product'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _idController,
                decoration: const InputDecoration(label: Text('Id')),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _deleteProduct,
                child: const Text('Delete'),
              ),
              const SizedBox(height: 20),
              if (_deleteProductFuture != null)
                FutureBuilder(
                  future: _deleteProductFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError ||
                        snapshot.data!.error.isNotEmpty) {
                      return Text('Error: ${snapshot.data!.error}');
                    } else if (!snapshot.hasData ||
                        snapshot.data!.data == null) {
                      return const Text('Data is null');
                    } else {
                      return const Text('Product deleted successfully!');
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
