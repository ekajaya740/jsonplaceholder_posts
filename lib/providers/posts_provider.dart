import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/config/dio.dart';
import 'package:jsonplaceholder_posts/schemas/post/comment/comment.dart';
import 'package:jsonplaceholder_posts/schemas/post/post.dart';

class PostsProvider extends ChangeNotifier {
  late List<Post> posts;
  late Post post;
  late List<Comment> comments;

  bool loading = false;

  Future requestPosts() async {
    loading = true;
    dynamic data = await DioService.instance.request('/posts', DioMethod.get);
    posts = (data.data as List)
        .map((json) => Post.fromJson(json as Map<String, dynamic>))
        .toList();

    loading = false;

    notifyListeners();
  }

  Future requestPostById(int id) async {
    loading = true;
    dynamic postData =
        await DioService.instance.request('/posts/$id', DioMethod.get);

    dynamic commentData =
        await DioService.instance.request('/posts/$id/comments', DioMethod.get);

    post = Post.fromJson(postData.data);
    comments = (commentData.data as List)
        .map((json) => Comment.fromJson(json as Map<String, dynamic>))
        .toList();

    loading = false;

    notifyListeners();
  }
}
