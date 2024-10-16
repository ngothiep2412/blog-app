import 'package:blog_app/data/repositories/auth_repo.dart';
import 'package:blog_app/data/repositories/categories_repo.dart';
import 'package:blog_app/data/repositories/posts_repo.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';
import 'package:blog_app/my_app.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:i18n_extension/i18n_extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initialLocale = await Utils.getLocale();

  FlavorConfig(name: "DEV", variables: {
    "counter": 0,
    "primaryColor": const Color(0xffE85520),
    "mainUrl": "https://techblog.codersangam.com/api/",
  });

  runApp(
    RepositoryProvider(
      create: (context) => Repository(
        tagsRepo: TagsRepo(),
        authRepo: AuthRepo(),
        postsRepo: PostsRepo(),
        categoriesRepo: CategoriesRepo(),
      ),
      child: I18n(
        initialLocale: initialLocale,
        child: MyApp(),
      ),
    ),
  );
}
