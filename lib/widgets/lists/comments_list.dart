import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/providers/expandable_text_provider.dart';
import 'package:jsonplaceholder_posts/schemas/post/comment/comment.dart';
import 'package:jsonplaceholder_posts/widgets/text/expandable_text.dart';
import 'package:provider/provider.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.comments});

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          comments.elementAt(index).name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: ChangeNotifierProvider(
            create: (BuildContext context) => ExpandableTextProvider(),
            child: ExpandableText(
              comments.elementAt(index).body,
              style: const TextStyle(fontSize: 16),
            )),
      ),
    );
  }
}
