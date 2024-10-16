import 'dart:convert';

import 'package:blog_app/data/data_source/remote/api_client.dart';
import 'package:blog_app/data/data_source/remote/api_endpoint_urls.dart';
import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/presentation/screens/general/categories/categories_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoriesRepo extends ApiClient {
  CategoriesRepo();

  Future<CategoriesModel> getAllCategories() async {
    try {
      final response = await getRequest(
          path: ApiEndpointUrls.categories, isTokenRequired: false);

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = categoriesModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        CategoriesModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      CategoriesModel();
    }

    return CategoriesModel();
  }

  Future<MessageModel> addNewCategories(
      {required String title, required String slug}) async {
    Map body = {'title': title, 'slug': slug};

    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addCategories,
        body: body,
        isTokenRequired: true,
      );

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = messageModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MessageModel();
    }

    return MessageModel();
  }

  Future<MessageModel> deleteCategories({required String id}) async {
    try {
      final response = await postRequest(
        path: "${ApiEndpointUrls.deleteCategories}/$id",
        isTokenRequired: true,
      );

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = messageModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MessageModel();
    }

    return MessageModel();
  }

  Future<MessageModel> updateCategories(
      {required String id, required String title, required String slug}) async {
    Map body = {
      'id': id,
      'title': title,
      'slug': slug,
    };

    try {
      final response = await postRequest(
        path: ApiEndpointUrls.updateCategories,
        body: body,
        isTokenRequired: true,
      );

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = messageModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MessageModel();
    }

    return MessageModel();
  }
}
