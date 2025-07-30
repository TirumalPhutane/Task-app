import 'package:demo/async_redux/typedef.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:flutter/material.dart';

class ARAddProductScreen extends StatefulWidget {
  const ARAddProductScreen({
    required this.loading,
    required this.addProductToList,
    super.key,
  });

  final bool loading;
  final AddProduct addProductToList;

  @override
  State<ARAddProductScreen> createState() => _ARAddProductScreenState();
}

class _ARAddProductScreenState extends State<ARAddProductScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  String? _idError = '';
  String? _titleError = '';
  String? _priceError = '';
  String? _descError = '';
  String? _categoryError = '';
  bool _showErrors = false;

  @override
  void dispose() {
    _idController.dispose();
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  bool validateFields() {
    var isValid = true;

    setState(() {
      _showErrors = true;

      if (_idController.text.trim().isEmpty) {
        _idError = 'ID is required';
        isValid = false;
      } else {
        _idError = null;
      }

      if (_titleController.text.trim().isEmpty) {
        _titleError = 'Title is required';
        isValid = false;
      } else {
        _titleError = null;
      }

      if (_priceController.text.trim().isEmpty) {
        _priceError = 'Price is required';
        isValid = false;
      } else {
        _priceError = null;
      }

      if (_descriptionController.text.trim().isEmpty) {
        _descError = 'Description is required';
        isValid = false;
      } else {
        _descError = null;
      }

      if (_categoryController.text.trim().isEmpty) {
        _categoryError = 'Category is required';
        isValid = false;
      } else {
        _categoryError = null;
      }
    });

    return isValid;
  }

  Future<void> _addProduct() async {
    if (!validateFields()) return;

    final product = Product(
      id: int.parse(_idController.text),
      title: _titleController.text,
      price: double.parse(_priceController.text),
      description: _descriptionController.text,
      category: _categoryController.text,
      image: 'https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg',
    );

    final success = await widget.addProductToList(product);

    if (success.isCompleted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        ),
      );
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add product.'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product To List')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Id',
                  errorText: _showErrors ? _idError : null,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (_idError != null && value.trim().isNotEmpty) {
                    setState(() => _idError = null);
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  errorText: _showErrors ? _titleError : null,
                ),
                onChanged: (value) {
                  if (_titleError != null && value.trim().isNotEmpty) {
                    setState(() => _titleError = null);
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  errorText: _showErrors ? _priceError : null,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (_priceError != null && value.trim().isNotEmpty) {
                    setState(() => _priceError = null);
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  errorText: _showErrors ? _descError : null,
                ),
                onChanged: (value) {
                  if (_descError != null && value.trim().isNotEmpty) {
                    setState(() => _descError = null);
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                  errorText: _showErrors ? _categoryError : null,
                ),
                onChanged: (value) {
                  if (_categoryError != null && value.trim().isNotEmpty) {
                    setState(() => _categoryError = null);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProduct,
                child: widget.loading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
