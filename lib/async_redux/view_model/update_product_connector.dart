import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/actions/update_product_action.dart';
import 'package:demo/async_redux/app_state.dart';
import 'package:demo/async_redux/screens/update_product_screen.dart';
import 'package:demo/async_redux/view_model/update_product_viewmodel.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:flutter/material.dart';

class UpdateProductConnector extends StatelessWidget {
  const UpdateProductConnector({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UpdateProductViewmodel>(
      vm: () => UpdateProductFactory(this),
      builder: (context, vm) => ARUpdateProductScreen(
        loading: vm.loading,
        product: product,
        updateProduct: vm.updateProduct,
      ),
    );
  }
}

class UpdateProductFactory
    extends
        VmFactory<AppState, UpdateProductConnector, UpdateProductViewmodel> {
  UpdateProductFactory(super.connector);

  @override
  UpdateProductViewmodel? fromStore() => UpdateProductViewmodel(
    loading: state.loading,
    updateProduct: (updateProduct) =>
        dispatchAndWait(UpdateProductAction(updateProduct)),
  );
}
