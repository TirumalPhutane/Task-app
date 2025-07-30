import 'package:async_redux/async_redux.dart';
//import 'package:demo/network_api/model/product.dart';
import 'package:demo/common/typedef.dart';

class UpdateProductViewmodel extends Vm {
  UpdateProductViewmodel({required this.loading, required this.updateProduct})
    : super(equals: [loading]);

  final bool loading;
  final UpdateProduct updateProduct;
}
