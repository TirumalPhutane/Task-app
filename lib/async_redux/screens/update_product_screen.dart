//import 'package:async_redux/async_redux.dart';
import 'package:demo/common/typedef.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:flutter/material.dart';

class ARUpdateProductScreen extends StatefulWidget {
  const ARUpdateProductScreen({
    required this.loading,
    required this.product,
    required this.updateProduct,
    super.key,
  });
  final bool loading;

  final Product product;
  final UpdateProduct updateProduct;

  @override
  State<ARUpdateProductScreen> createState() => _ARUpdateProductScreenState();
}

class _ARUpdateProductScreenState extends State<ARUpdateProductScreen> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  String? _idError = '';
  String? _titleError = '';
  String? _priceError = '';
  String? _descError = '';
  String? _categoryError = '';
  bool _showErrors = false;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.product.id.toString());
    _titleController = TextEditingController(text: widget.product.title);
    _priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    _descriptionController = TextEditingController(
      text: widget.product.description,
    );
    _categoryController = TextEditingController(text: widget.product.category);
  }

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
        _titleError = 'ID is required';
        isValid = false;
      } else {
        _titleError = null;
      }

      if (_priceController.text.trim().isEmpty) {
        _priceError = 'ID is required';
        isValid = false;
      } else {
        _priceError = null;
      }

      if (_descriptionController.text.trim().isEmpty) {
        _descError = 'ID is required';
        isValid = false;
      } else {
        _descError = null;
      }

      if (_categoryController.text.trim().isEmpty) {
        _categoryError = 'ID is required';
        isValid = false;
      } else {
        _categoryError = null;
      }
    });

    return isValid;
  }

  Future<void> _updateProduct() async {
    if (!validateFields()) return;

    final product = Product(
      id: int.parse(_idController.text),
      title: _titleController.text,
      price: double.parse(_priceController.text),
      description: _descriptionController.text,
      category: _categoryController.text,
      image: widget.product.image,
    );

    final result = await widget.updateProduct(product);

    if (result.isCompleted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product updated successfully!'),
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
          content: Text('Failed to update product.'),
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
      appBar: AppBar(title: const Text('Update Product')),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
                onPressed: _updateProduct,
                child: widget.loading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Text('Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
