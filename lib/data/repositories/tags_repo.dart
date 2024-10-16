import 'dart:convert';
import 'package:blog_app/data/models/message_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/tags/tags_model.dart';
import '../data_source/remote/api_client.dart';
import '../data_source/remote/api_endpoint_urls.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      final response =
          await getRequest(path: ApiEndpointUrls.tags, isTokenRequired: false);

      if (response.statusCode == 200) {
        //* 1st solution
        final responseData = tagsModelFromJson(jsonEncode(response.data));

        //* 2nd solution
        // final responseData = TagsModel.fromJson(response.data);

        // Vx.log(responseData);
        return responseData;
      } else {
        TagsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      TagsModel();
    }

    return TagsModel();
  }

  Future<MessageModel> addNewTags(
      {required String title, required String slug}) async {
    Map body = {'title': title, 'slug': slug};

    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addTags,
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

  Future<MessageModel> deleteTags({required String id}) async {
    try {
      final response = await postRequest(
        path: "${ApiEndpointUrls.deleteTags}/$id",
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
        TagsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      TagsModel();
    }

    return MessageModel();
  }

  Future<MessageModel> updateTags(
      {required String id, required String title, required String slug}) async {
    Map body = {
      'id': id,
      'title': title,
      'slug': slug,
    };

    try {
      final response = await postRequest(
        path: ApiEndpointUrls.updateTags,
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
        TagsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      TagsModel();
    }

    return MessageModel();
  }
}
