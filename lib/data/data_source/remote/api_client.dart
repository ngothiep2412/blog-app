import 'package:blog_app/data/data_source/remote/api_constant.dart';
import 'package:blog_app/data/data_source/remote/api_exception.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// GET REQUEST
class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.mainUrl);

    dio = Dio(baseOptions);
  }

  Options options = Options();

  Future<Response> getRequest(
      {required String path, required bool isTokenRequired}) async {
    if (isTokenRequired) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers
        ..addAll({
          "Authorization": "Bearer $token",
        });
    }
    // dio.interceptors.add(PrettyDioLogger());

    try {
      debugPrint(
          "🚀======================API REQUEST==========================🚀");
      debugPrint("Request Url: ${baseOptions.baseUrl + path}");

      var response = await dio.get(path, options: options);
      debugPrint(
          "🔥======================API RESPONSE==========================🔥");

      debugPrint("Status code: ${response.statusCode}");
      debugPrint("DATA: ${response.data}");

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  // POST REQUEST
  Future<Response> postRequest({
    required String path,
    dynamic body,
    bool isTokenRequired = false,
  }) async {
    if (isTokenRequired) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers
        ..addAll({
          "Authorization": "Bearer $token",
        });
    }
    try {
      debugPrint(
          "🚀======================API REQUEST==========================🚀");
      debugPrint("Request Url: ${baseOptions.baseUrl + path}");

      var response = await dio.post(
        path,
        data: body,
        options: options,
      );
      debugPrint(
          "🔥======================API RESPONSE==========================🔥");

      debugPrint("Status code: ${response.statusCode}");
      debugPrint("DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
