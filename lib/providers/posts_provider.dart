import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/config/dio.dart';
import 'package:jsonplaceholder_posts/schemas/post/posts.dart';

class PostsProvider extends ChangeNotifier {
  late Posts posts;

  bool loading = false;

  requestPosts() async {
    loading = true;
    dynamic data = await DioService.instance.request('/posts', DioMethod.get);
    posts = Posts.fromJson(data);
    loading = false;

    notifyListeners();
  }
}
