import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/config/dio.dart';
import 'package:jsonplaceholder_posts/schemas/post/comment/comments.dart';
import 'package:jsonplaceholder_posts/schemas/post/post.dart';
import 'package:jsonplaceholder_posts/schemas/post/posts.dart';

class PostsProvider extends ChangeNotifier {
  late List<Post> posts;
  late Post post;
  late Comments comments;

  bool loading = false;

  requestPosts() async {
    loading = true;
    dynamic data = await DioService.instance.request('/posts', DioMethod.get);
    posts = (data.data as List)
        .map((json) => Post.fromJson(json as Map<String, dynamic>))
        .toList();

    loading = false;

    notifyListeners();
  }

  requestPostById(int id) async {
    loading = true;
    dynamic postData =
        await DioService.instance.request('/posts/$id', DioMethod.get);

    dynamic commentData =
        await DioService.instance.request('posts/$id/comments', DioMethod.get);

    post = Post.fromJson(postData);
    comments = Comments.fromJson(commentData);

    notifyListeners();
  }
}
