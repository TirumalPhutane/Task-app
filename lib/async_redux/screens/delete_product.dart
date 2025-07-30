import 'package:demo/common/typedef.dart';
import 'package:flutter/material.dart';

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({
    required this.id,
    required this.loading,
    required this.deleteProduct,
    super.key,
  });

  final int id;
  final bool loading;
  final DeleteTheProduct deleteProduct;

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  Future<void> _deleteProduct() async {
    final success = await widget.deleteProduct(widget.id);

    if (context.mounted) Navigator.of(context).pop();

    if (success.isCompletedOk) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product deleted successfully!'),
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
          content: Text('Failed to delete product.'),
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
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        showDialog<Widget>(
          context: context,
          builder: (ctx) {
            return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                title: const Text('Delete Product'),
                content: const Text(
                  'Are you sure you want to delete this product?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: _deleteProduct,
                    child: widget.loading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 3),
                          )
                        : const Text('Delete'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
