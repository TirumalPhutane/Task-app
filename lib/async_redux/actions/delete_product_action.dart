import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:demo/async_redux/app_state.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/locator.dart';

class DeleteProductAction extends ReduxAction<AppState> {
  DeleteProductAction(this.productId);
  final int productId;

  @override
  Future<AppState?> reduce() async {
    try {
      final service = locator<DataService>();
      final response = await service.deleteProduct(productId);

      if (response.error.isNotEmpty) {
        return state.copy(error: response.error, loading: false);
      }

      final updatedList = state.products.toList()
        ..removeWhere((p) => p.id == productId);
      return state.copy(products: updatedList, error: '', loading: false);
    } on Exception {
      return state.copy(error: 'Something went wrong', loading: false);
    }
  }
}
