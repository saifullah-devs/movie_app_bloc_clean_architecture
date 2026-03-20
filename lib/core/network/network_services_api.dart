import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app_bloc/core/exceptions/app_exceptions.dart';
import 'package:movie_app_bloc/core/network/base_api_services.dart';

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('');
    }
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('');
    } catch (e) {
      throw Exception(e);
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw RequestException('Bad request: ${response.body}');
      case 401:
        dynamic jsonResponse = jsonDecode(response.body);
        String errorMessage = jsonResponse['error'] ?? 'Unauthorized access';
        throw UnauthorisedException(errorMessage);
      case 403:
        throw UnauthorisedException('Unauthorized access: ${response.body}');
      case 500:
        throw FetchDataException(
          'Error occurred with status code: ${response.statusCode.toString()}',
        );
      default:
        throw FetchDataException(
          'Error occurred with status code: ${response.statusCode.toString()}',
        );
    }
  }

  @override
  Future deleteApi(String url) async {
    try {
      return await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('');
    } catch (e) {
      throw Exception('Failed to delete data: $e');
    }
  }
}
