import 'package:demo/network_api/model/product.dart';

class AppState {
  AppState({
    required this.products,
    required this.loading,
    required this.error,
  });
  final List<Product> products;
  final bool loading;
  final String error;

  static AppState initialState() =>
      AppState(products: [], loading: false, error: '');

  AppState copy({List<Product>? products, bool? loading, String? error}) =>
      AppState(
        products: products ?? this.products,
        loading: loading ?? this.loading,
        error: error ?? this.error,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          products == other.products &&
          loading == other.loading &&
          error == other.error;

  @override
  int get hashCode => products.hashCode ^ loading.hashCode ^ error.hashCode;
}
