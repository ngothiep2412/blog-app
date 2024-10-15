import 'dart:convert';
import 'package:blog_app/presentation/screens/general/home/home_model.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';
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
}
