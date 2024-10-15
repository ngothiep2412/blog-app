import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/tags/tags_model.dart';
import '../data_source/remote/api_client.dart';
import '../data_source/remote/api_endpoint_urls.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.tags);

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
}
