import 'package:demo/async_redux/view_model/delete_product_connector.dart';
import 'package:demo/navigation/route_names.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:flutter/material.dart';

class ARProductListScreen extends StatefulWidget {
  const ARProductListScreen({
    required this.products,
    required this.loading,
    required this.error,
    required this.fetchProducts,
    super.key,
  });

  final List<Product> products;
  final bool loading;
  final String error;
  final VoidCallback fetchProducts;

  @override
  State<ARProductListScreen> createState() => _ARProductListScreenState();
}

class _ARProductListScreenState extends State<ARProductListScreen> {
  @override
  void initState() {
    super.initState();
    widget.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Redux Demo')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.arAddProductScreen);
        },
        child: const Icon(Icons.add),
      ),
      body: widget.loading
          ? const Center(child: CircularProgressIndicator())
          : widget.error.isNotEmpty
          ? Center(child: Text('Error: ${widget.error}'))
          : ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                final product = widget.products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.image,
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              Text(
                                product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                'Category: ${product.category}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 0,
                                children: [
                                  Text(
                                    '₹${product.price.toStringAsFixed(2)}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    iconSize: 15,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        RouteNames.arUpdatePriceScreen,
                                        arguments: product,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.arUpdateProductScreen,
                                  arguments: product,
                                );
                              },
                            ),
                            DeleteProductConnector(productId: product.id),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
