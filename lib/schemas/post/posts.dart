import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jsonplaceholder_posts/schemas/post/post.dart';

part 'posts.freezed.dart';
part 'posts.g.dart';

@freezed
abstract class Posts with _$Posts {
  const factory Posts({
    required List<Post> posts,
  }) = _Posts;

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
}
