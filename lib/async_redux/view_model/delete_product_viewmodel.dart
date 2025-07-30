import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/typedef.dart';

class DeleteProductViewmodel extends Vm {
  DeleteProductViewmodel({required this.loading, required this.deleteProduct})
    : super(equals: [loading]);

  final bool loading;
  final DeleteTheProduct deleteProduct;
}
