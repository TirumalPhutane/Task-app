import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/actions/add_product_action.dart';
import 'package:demo/common/app_state.dart';
import 'package:demo/async_redux/screens/add_product_screen.dart';
import 'package:demo/async_redux/view_model/add_product_viewmodel.dart';
import 'package:flutter/material.dart';

class AddProductConnector extends StatelessWidget {
  const AddProductConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddProductViewmodel>(
      vm: () => AddProductFactory(this),
      builder: (context, vm) => ARAddProductScreen(
        loading: vm.loading,
        addProductToList: vm.addProductToList,
      ),
    );
  }
}

class AddProductFactory
    extends VmFactory<AppState, AddProductConnector, AddProductViewmodel> {
  AddProductFactory(super.connector);

  @override
  AddProductViewmodel? fromStore() => AddProductViewmodel(
    loading: state.loading,
    addProductToList: (product) => dispatchAndWait(AddProductAction(product)),
  );
}
