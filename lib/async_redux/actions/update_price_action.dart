import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/app_state.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/locator.dart';

class UpdatePricetAction extends ReduxAction<AppState> {
  UpdatePricetAction(this.productId, this.updateFields);
  final int productId;
  final Map<String, dynamic> updateFields;

  @override
  void before() => dispatch(ChangeLoadingAction(isLoading: true));

  @override
  void after() => dispatch(ChangeLoadingAction(isLoading: false));

  @override
  Future<AppState?> reduce() async {
    try {
      final service = locator<DataService>();
      final response = await service.updateProductPrice(
        productId,
        updateFields,
      );

      if (response.error.isNotEmpty) {
        return state.copy(error: response.error, loading: false);
      }

      final updatedList = state.products.map((product) {
        if (product.id == productId) {
          return product.copy(updateFields);
        } else {
          return product;
        }
      }).toList();
      return state.copy(products: updatedList, error: '', loading: false);
    } on Exception {
      return state.copy(error: 'Something went wrong', loading: false);
    }
  }
}

class ChangeLoadingAction extends ReduxAction<AppState> {
  ChangeLoadingAction({required this.isLoading});
  final bool isLoading;

  @override
  AppState reduce() => state.copy(loading: isLoading);
}
