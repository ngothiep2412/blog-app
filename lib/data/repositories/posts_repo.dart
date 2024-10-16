import 'dart:convert';
import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/presentation/screens/general/home/home_model.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data_source/remote/api_client.dart';
import '../data_source/remote/api_endpoint_urls.dart';

class PostsRepo extends ApiClient {
  PostsRepo();

  Future<HomeModel> getAllPosts() async {
    try {
      final response = await getRequest(
        path: ApiEndpointUrls.posts,
        isTokenRequired: false,
      );

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = homeModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        HomeModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      HomeModel();
    }

    return HomeModel();
  }

  Future<ProfileModel> getUserPosts() async {
    try {
      final response = await getRequest(
        path: ApiEndpointUrls.userPosts,
        isTokenRequired: true,
      );

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = profileModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        ProfileModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      ProfileModel();
    }

    return ProfileModel();
  }

  Future<MessageModel> addNewPosts({
    required String title,
    required String slug,
    required int tagId,
    required int categoryId,
    required String body,
    required String userId,
    required String fileName,
    required String filePath,
  }) async {
    final formData = FormData.fromMap({
      'title': title,
      'slug': slug,
      'categories': categoryId,
      'tags': tagId,
      'body': body,
      'status': '1',
      'user_id': userId,
      'featuredimage':
          await MultipartFile.fromFile(filePath, filename: fileName),
    });

    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addPosts,
        body: formData,
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
