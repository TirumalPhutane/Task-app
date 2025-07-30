import 'dart:typed_data';

import 'package:demo/network_api/model/new_response.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/utils/api_helper.dart';

class WebDataService extends DataService {
  final baseurl = 'https://fakestoreapi.com/products';

  @override
  Future<NewResponse> getProductsData() {
    return ApiHelper.getRequest(baseurl);
  }

  @override
  Future<NewResponse> getProductById(int id) {
    return ApiHelper.getRequest(baseurl, path: '/$id');
  }

  @override
  Future<NewResponse> addProductToList(Product product) {
    return ApiHelper.postRequest(baseurl, body: product.toJson());
  }

  @override
  Future<NewResponse> updateProduct({
    required int id,
    required Product product,
  }) {
    return ApiHelper.putRequest('$baseurl/$id', product.toJson());
  }

  @override
  Future<NewResponse> updateProductPrice(
    int id,
    Map<String, dynamic> updateFields,
  ) {
    return ApiHelper.patchRequest('$baseurl/$id', updateFields);
  }

  @override
  Future<NewResponse> deleteProduct(int id) {
    return ApiHelper.deleteRequest('$baseurl/$id');
  }

  @override
  Future<NewResponse> uploadFile(Uint8List fileBytes, String fileName) {
    return ApiHelper.postRequest(
      baseurl,
      fileBytes: fileBytes,
      fileName: fileName,
    );
  }
}
