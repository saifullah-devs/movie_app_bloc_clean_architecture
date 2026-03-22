import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app_bloc/core/exceptions/app_exceptions.dart';
import 'package:movie_app_bloc/core/network/base_api_services.dart';

class NetworkServicesApi implements BaseApiServices {
  static const int _defaultTimeout = 15;

  Map<String, String> _getHeaders() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  Future<dynamic> getApi(String url) async {
    return _processRequest(
      () => http.get(Uri.parse(url), headers: _getHeaders()),
    );
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    return _processRequest(
      () => http.post(
        Uri.parse(url),
        headers: _getHeaders(),
        body: jsonEncode(data),
      ),
    );
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    return _processRequest(
      () => http.delete(Uri.parse(url), headers: _getHeaders()),
    );
  }

  Future<dynamic> _processRequest(
    Future<http.Response> Function() httpRequest,
  ) async {
    try {
      final response = await httpRequest().timeout(
        const Duration(seconds: _defaultTimeout),
      );
      return _returnResponse(response);
    } on SocketException {
      throw NetworkException('Check your data or Wi-Fi connection.');
    } on TimeoutException {
      throw DataParsingException('Server took too long to respond.');
    } on FormatException {
      throw DataParsingException('Bad response format from server.');
    } catch (e) {
      // Catch-all for unexpected system errors
      throw DataParsingException('Unexpected error: ${e.toString()}');
    }
  }

  /// Detailed Response Switch
  dynamic _returnResponse(http.Response response) {
    final responseData = response.body.isNotEmpty
        ? jsonDecode(response.body)
        : {};

    switch (response.statusCode) {
      case 200:
      case 201:
        return responseData;
      case 400:
        throw BadRequestException(
          _extractMessage(responseData, 'Invalid Request'),
        );
      case 401:
      case 403:
        throw UnauthorisedException(
          _extractMessage(responseData, 'Unauthorized Access'),
        );
      case 404:
        throw BadRequestException('Resource not found (404)');
      case 500:
        throw DataParsingException('Internal Server Error. Please try later.');
      default:
        throw DataParsingException(
          'Error ${response.statusCode}: ${response.reasonPhrase}',
        );
    }
  }

  String _extractMessage(dynamic json, String defaultMsg) {
    if (json is Map && json.containsKey('message')) return json['message'];
    if (json is Map && json.containsKey('error')) return json['error'];
    return defaultMsg;
  }
}
