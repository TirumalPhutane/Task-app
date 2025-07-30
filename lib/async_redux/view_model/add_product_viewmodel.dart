import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/typedef.dart';

class AddProductViewmodel extends Vm {
  AddProductViewmodel({required this.loading, required this.addProductToList})
    : super(equals: [loading]);

  final bool loading;
  final AddProduct addProductToList;
}
