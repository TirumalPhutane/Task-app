import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:demo/common/app_state.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/locator.dart';

class FetchProductsAction extends ReduxAction<AppState> {
  @override
  void before() => dispatch(ChangeLoadingAction(isLoading: true));

  @override
  void after() => dispatch(ChangeLoadingAction(isLoading: false));

  @override
  Future<AppState?> reduce() async {
    try {
      final service = locator<DataService>();
      final response = await service.getProductsData();

      if (response.error.isNotEmpty) {
        return state.copy(error: response.error, loading: false);
      }

      final products = (response.data as List)
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();

      return state.copy(products: products, loading: false);
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
