import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';


class Network {

  // next three lines makes this class a Singleton
  static Network _instance = Network.internal();
  Network.internal();
  factory Network() => _instance;


  final JsonDecoder _decoder = JsonDecoder();
  dynamic _decodedRes;


  Future<dynamic> doRequest({@required String path, @required String method, @required BuildContext context, Map requestParams, Map body}) async {

    BaseOptions options = BaseOptions(
      baseUrl: '',
      connectTimeout: 10000,
      receiveTimeout: 10000,
      method: method,
      headers: await _baseHeaders(),
      contentType: ContentType.parse('application/json'),
    );

    Dio dio = Dio(options);
    Response response;
    FormData formData = FormData();
    if (body != null) {
      formData = FormData.from(body);
    }

    try {
      response = await dio.request(path, queryParameters: requestParams, data: formData);

      _decodedRes = _decoder.convert(response.data);

      print('NETWORK: ======================='  + _decodedRes['data'].toString());
      return _decodedRes['data'];

    } on DioError catch (error) {
      _handleError(error, context);
    }

  }

  void _handleError(DioError error, BuildContext context) {
    String errorDescription = '';

    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = 'Request was cancelled';
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = 'Connection timed out. Try again later';
          break;
        case DioErrorType.DEFAULT:
          errorDescription = 'No available network detected';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = 'Server response timed out. Try again later';
          break;
        case DioErrorType.RESPONSE:
          errorDescription = 'Server error. Status: ${error.response.statusCode}';
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = 'Connection timed out. Try again later';
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }


  }

  Future<Map<String, String>> _baseHeaders() async {

    Map<String, String> headers = Map();
    return headers;
  }

}
