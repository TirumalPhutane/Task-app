import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/actions/update_price_action.dart';
import 'package:demo/common/app_state.dart';
import 'package:demo/async_redux/screens/update_price_screen.dart';
import 'package:demo/async_redux/view_model/update_price_viewmodel.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:flutter/material.dart';

class UpdatePriceConnector extends StatelessWidget {
  const UpdatePriceConnector({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UpdateFieldsViewmodel>(
      vm: () => UpdatePriceFactory(this),
      builder: (context, vm) => UpdatePriceScreen(
        loading: vm.loading,
        product: product,
        updateFields: vm.updateFields,
      ),
    );
  }
}

class UpdatePriceFactory
    extends VmFactory<AppState, UpdatePriceConnector, UpdateFieldsViewmodel> {
  UpdatePriceFactory(super.connector);

  @override
  UpdateFieldsViewmodel? fromStore() => UpdateFieldsViewmodel(
    loading: state.loading,
    updateFields: (id, updateFields) =>
        dispatchAndWait(UpdatePricetAction(id, updateFields)),
  );
}
