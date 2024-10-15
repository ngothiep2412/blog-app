import 'package:blog_app/data/repositories/auth_repo.dart';
import 'package:blog_app/data/repositories/posts_repo.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';
import 'package:blog_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(name: "PROD", variables: {
    "counter": 0,
    "primaryColor": const Color(0xFF4CAF50),
    "mainUrl": "https://techblog.codersangam.com/api/",
  });

  runApp(
    RepositoryProvider(
      create: (context) => Repository(
        tagsRepo: TagsRepo(),
        authRepo: AuthRepo(),
        postsRepo: PostsRepo(),
      ),
      child: MyApp(),
    ),
  );
}
