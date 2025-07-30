import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/typedef.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:flutter/material.dart';

class UpdatePriceScreen extends StatefulWidget {
  const UpdatePriceScreen({
    required this.loading,
    required this.product,
    required this.updateFields,
    super.key,
  });

  final bool loading;
  final Product product;
  final UpdateFields updateFields;

  @override
  State<UpdatePriceScreen> createState() => _UpdatePriceScreenState();
}

class _UpdatePriceScreenState extends State<UpdatePriceScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  Map<String, dynamic> updatedFields = {};

  @override
  void initState() {
    super.initState();
    _idController.text = widget.product.id.toString();
    _titleController.text = widget.product.title;
    _priceController.text = widget.product.price.toString();
    _descriptionController.text = widget.product.description;
    _categoryController.text = widget.product.category;
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

  Future<void> _updatePrice() async {
    if (int.parse(_idController.text.trim()) != widget.product.id) {
      updatedFields['id'] = int.parse(_idController.text.trim());
    }

    if (_titleController.text.trim() != widget.product.title) {
      updatedFields['title'] = _titleController.text.trim();
    }

    if (double.parse(_priceController.text.trim()) != widget.product.price) {
      updatedFields['price'] = double.parse(_priceController.text.trim());
    }

    if (_descriptionController.text.trim() != widget.product.description) {
      updatedFields['description'] = _descriptionController.text.trim();
    }

    if (_categoryController.text.trim() != widget.product.category) {
      updatedFields['category'] = _categoryController.text.trim();
    }

    if (updatedFields.isNotEmpty) {
      ActionStatus result = await widget.updateFields(
        widget.product.id,
        updatedFields,
      );

      if (result.isCompletedOk && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Changes saved successfully!'),
            margin: EdgeInsets.all(10),
          ),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update price.'),
            margin: EdgeInsets.all(10),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No changes made!'),
          margin: EdgeInsets.all(10),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Product Price")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 10,
            children: [
              TextField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'Id'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  //errorText: errorText,
                ),
                // onChanged: (_) => setState(() => _showValidation = false),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: widget.loading ? null : _updatePrice,
                child: widget.loading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
