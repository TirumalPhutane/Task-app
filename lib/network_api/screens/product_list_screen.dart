import 'package:demo/network_api/model/new_response.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:demo/network_api/screens/add_product_screen.dart';
import 'package:demo/network_api/screens/delete_product_screen.dart';
import 'package:demo/network_api/screens/edit_product_screen.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/locator.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  Future<NewResponse>? _productsFuture;
  final DataService _service = locator();

  @override
  void initState() {
    super.initState();
    _productsFuture = _service.getProductsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Update product',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const EditProductScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete product',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const DeleteProductScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<NewResponse>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data == null) {
            return const Center(child: Text('No data found.'));
          }

          final products = (snapshot.data!.data as List)
              .map((item) => Product.fromJson(item as Map<String, dynamic>))
              .toList();

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
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
                          children: [
                            Text(
                              product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Category: ${product.category}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '₹${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (context) => const AddProductScreen(),
            ),
          );
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
