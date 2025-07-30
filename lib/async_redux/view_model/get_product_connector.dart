import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/actions/fetch_products_action.dart';
import 'package:demo/async_redux/app_state.dart';
import 'package:demo/async_redux/screens/product_list_screen.dart';
import 'package:demo/async_redux/view_model/get_product_viewmodel.dart';
import 'package:flutter/material.dart';

class GetProductConnector extends StatelessWidget {
  const GetProductConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GetProductViewmodel>(
      vm: () => GetProductsFactory(this),
      builder: (context, vm) => ARProductListScreen(
        products: vm.products,
        loading: vm.loading,
        error: vm.error,
        fetchProducts: vm.fetchProducts,
      ),
    );
  }
}

class GetProductsFactory
    extends VmFactory<AppState, GetProductConnector, GetProductViewmodel> {
  GetProductsFactory(super.connector);

  @override
  GetProductViewmodel? fromStore() => GetProductViewmodel(
    products: state.products,
    loading: state.loading,
    error: state.error,
    fetchProducts: () => dispatch(FetchProductsAction()),
  );
}
