import 'package:blog_app/data/repositories/auth_repo.dart';
import 'package:blog_app/data/repositories/posts_repo.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';

class Repository {
  Repository({
    required this.tagsRepo,
    required this.authRepo,
    required this.postsRepo,
  });

  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
  final PostsRepo postsRepo;
}
