import 'dart:convert';
import 'dart:typed_data';

import 'package:demo/network_api/model/new_response.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ApiHelper {
  // GET method
  static Future<NewResponse> getRequest(
    String baseUrl, {
    Map<String, String>? headers,
    String? path,
  }) async {
    try {
      final url = path != null && path.isNotEmpty ? '$baseUrl$path' : baseUrl;
      final response = await http.get(Uri.parse(url), headers: headers);

      return _handleResponse(response);
    } on Exception {
      return const NewResponse(data: null, error: 'Something went wrong');
    }
  }

  // POST Method
  static Future<NewResponse> postRequest(
    String url, {
    Map<String, String>? headers,
    dynamic body,
    Uint8List? fileBytes,
    String? fileName,
  }) async {
    try {
      http.Response response;
      if (fileBytes != null && fileName != null) {
        final mimeType = lookupMimeType(fileName);
        final mediaType = mimeType!.split('/');

        final request = http.MultipartRequest('POST', Uri.parse(url));
        request.files.add(
          http.MultipartFile.fromBytes(
            'file',
            fileBytes,
            filename: fileName,
            contentType: MediaType(mediaType[0], mediaType[1]),
          ),
        );

        if (body != null && body is Map<String, dynamic>) {
          body.forEach((key, value) {
            request.fields[key] = value.toString();
          });
        }

        final streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
      } else {
        response = await http.post(
          Uri.parse(url),
          headers: headers ?? {'Content-Type': 'application/json'},
          body: json.encode(body),
        );
      }
      return _handleResponse(response);
    } on Exception {
      return const NewResponse(data: null, error: 'Something went wrong');
    }
  }

  // PUT Method
  static Future<NewResponse> putRequest(
    String path,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(path),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      return _handleResponse(response);
    } on Exception {
      return const NewResponse(data: null, error: 'Something went wrong');
    }
  }

  //PATCH Method
  static Future<NewResponse> patchRequest(
    String path,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(path),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      return _handleResponse(response);
    } on Exception {
      return const NewResponse(data: null, error: 'Something went wrong');
    }
  }

  // DELETE Method
  static Future<NewResponse> deleteRequest(
    String path, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse(path),
        headers: headers ?? {'Content-Type': 'application/json'},
      );

      return _handleResponse(response);
    } on Exception {
      return const NewResponse(data: null, error: 'Something went wrong');
    }
  }

  // Response handling
  static NewResponse _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = response.body.isNotEmpty ? jsonDecode(response.body) : null;
      return NewResponse(data: body, error: '');
    } else {
      return NewResponse(
        data: null,
        error: 'Error ${response.statusCode}: ${response.reasonPhrase}',
      );
    }
  }
}
