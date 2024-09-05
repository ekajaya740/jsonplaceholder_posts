import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jsonplaceholder_posts/schemas/post/comment/comment.dart';

part 'comments.freezed.dart';
part 'comments.g.dart';

@freezed
class Comments with _$Comments {
  const factory Comments({required List<Comment> comments}) = _Comments;

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);
}
