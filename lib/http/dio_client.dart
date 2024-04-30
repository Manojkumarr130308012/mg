import 'dart:convert';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mg/http/httpurls.dart';
import 'package:mg/http/logging.dart';
import 'package:dio/dio.dart';
import 'package:mg/utils/base_equatable.dart';

class DioClient {
  static dynamic dioConfig({String? token}) {
    var dynHeader = {
      'contentType': 'application/json',
      'Authorization': '2P2mfbGMap5GRtjFhqTP5V85McgPT75BtmkNuRAn'
    };

    Dio dio = Dio(
      BaseOptions(
          baseUrl: HttpUrl.baseUrl,
          connectTimeout: const Duration(milliseconds: 70000),
          receiveTimeout: const Duration(milliseconds: 70000),
          followRedirects: true,
          headers: dynHeader),
    )..interceptors.add(Logging());
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  static dynamic errorHandling(DioException e) {
    debugPrint('dio exception ${e.message}');

    if (e.type == DioExceptionType.unknown) {
      debugPrint('responseData${DioExceptionType.values}');
      return e.response;
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      return showToast('Please check your internet connection');
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return showToast('Unable to connect to the server');
    }
    if (e.type == DioExceptionType.badResponse) {
      return 'Something went wrong';
    }

    if (e.type == DioExceptionType.cancel) {
      return 'Something went wrong';
    }
  }

  static List<dynamic>? listOfMultiPart(List<File>? file) {
    final List<dynamic> multiPartValues = [];
    for (File element in file!) {
      multiPartValues.add(MultipartFile.fromFile(
        element.path,
        filename: element.path.split('/').last,
      ));
    }
    return multiPartValues;
  }
}

class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> _parseJson(String text) {
  return compute(_parseAndDecode, text);
}
