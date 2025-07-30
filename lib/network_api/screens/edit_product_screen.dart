import 'package:demo/network_api/model/new_response.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/locator.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  Future<NewResponse>? _updateProductFuture;
  final DataService _service = locator();

  @override
  void dispose() {
    _idController.dispose();
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _updateProduct() {
    setState(() {
      _updateProductFuture = _service.updateProduct(
        id: int.parse(_idController.text),
        product: Product(
          id: int.parse(_idController.text),
          title: _titleController.text,
          price: double.parse(_priceController.text),
          description: _descriptionController.text,
          category: _categoryController.text,
          image:
              'https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(label: Text('Id')),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(label: Text('Price')),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(label: Text('Description')),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(label: Text('Category')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProduct,
              child: const Text('Update'),
            ),
            const SizedBox(height: 10),
            if (_updateProductFuture != null)
              FutureBuilder<NewResponse>(
                future: _updateProductFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError ||
                      snapshot.data!.error.isNotEmpty) {
                    return Text('Error: ${snapshot.data!.error}');
                  } else if (!snapshot.hasData || snapshot.data!.data == null) {
                    return const Text('Data is null');
                  } else {
                    return const Text('Product updated successfully!');
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
