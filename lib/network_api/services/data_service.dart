import 'dart:typed_data';

import 'package:demo/network_api/model/new_response.dart';
import 'package:demo/network_api/model/product.dart';

abstract class DataService {
  Future<NewResponse> getProductsData();
  Future<NewResponse> getProductById(int id);
  Future<NewResponse> addProductToList(Product product);
  Future<NewResponse> updateProduct({
    required int id,
    required Product product,
  });
  Future<NewResponse> deleteProduct(int id);
  Future<NewResponse> uploadFile(Uint8List fileBytes, String fileName);
  Future<NewResponse> updateProductPrice(
    int id,
    Map<String, dynamic> updateFields,
  );
}
