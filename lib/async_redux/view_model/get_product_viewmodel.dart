import 'package:async_redux/async_redux.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:flutter/widgets.dart';

class GetProductViewmodel extends Vm {
  GetProductViewmodel({
    required this.products,
    required this.loading,
    required this.error,
    required this.fetchProducts,
  }) : super(equals: [products, loading, error]);

  final List<Product> products;
  final bool loading;
  final String error;
  final VoidCallback fetchProducts;
}
