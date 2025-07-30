import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/actions/delete_product_action.dart';
import 'package:demo/async_redux/app_state.dart';
import 'package:demo/async_redux/screens/delete_product.dart';
import 'package:demo/async_redux/view_model/delete_product_viewmodel.dart';
import 'package:flutter/material.dart';

class DeleteProductConnector extends StatelessWidget {
  const DeleteProductConnector({required this.productId, super.key});
  final int productId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeleteProductViewmodel>(
      vm: () => DeleteProductFactory(this),
      builder: (context, vm) => DeleteProduct(
        id: productId,
        loading: vm.loading,
        deleteProduct: vm.deleteProduct,
      ),
    );
  }
}

class DeleteProductFactory
    extends
        VmFactory<AppState, DeleteProductConnector, DeleteProductViewmodel> {
  DeleteProductFactory(super.connector);

  @override
  DeleteProductViewmodel? fromStore() => DeleteProductViewmodel(
    loading: state.loading,
    deleteProduct: (productId) =>
        dispatchAndWait(DeleteProductAction(productId)),
  );
}
