import 'dart:convert';
import 'package:blog_app/data/data_source/remote/api_client.dart';
import 'package:blog_app/data/data_source/remote/api_endpoint_urls.dart';
import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/presentation/screens/auth/login/login_model.dart';
import 'package:blog_app/presentation/screens/auth/register/register_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModel> userLogin(
      String email, String password, BuildContext context) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };

      final response =
          await postRequest(path: ApiEndpointUrls.login, body: body);

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = loginModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      if (context.mounted) {
        VxToast.show(context, msg: e.toString());
      }

      LoginModel();
    }

    return LoginModel();
  }

  Future<MessageModel> userLogout(BuildContext context) async {
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.logout, isTokenRequired: true);

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = messageModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        LoginModel();
      }
    } on Exception catch (_) {
      MessageModel();
    }

    return MessageModel();
  }

  Future<RegisterModel> userRegister({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      Map<String, dynamic> body = {
        "name": name,
        "email": email,
        "password": password,
      };
      var response =
          await postRequest(path: ApiEndpointUrls.register, body: body);
      if (response.statusCode == 200) {
        var responseData = registerModelFromJson(jsonEncode(response.data));
        return responseData;
      }
    } on DioException catch (e) {
      if (context.mounted) {
        VxToast.show(context, msg: e.toString());
      }

      return RegisterModel();
    }
    return RegisterModel();
  }
}
