import 'package:async_redux/async_redux.dart';
import 'package:demo/network_api/model/product.dart';

typedef AddProduct = Future<ActionStatus> Function(Product);
typedef DeleteTheProduct = Future<ActionStatus> Function(int id);
typedef UpdateProduct = Future<ActionStatus> Function(Product product);
typedef UpdateFields =
    Future<ActionStatus> Function(int id, Map<String, dynamic> updateFields);
