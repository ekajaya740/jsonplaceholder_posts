import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/schemas/post/post.dart';
import 'package:go_router/go_router.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          posts.elementAt(index).title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          posts.elementAt(index).body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          context.push('/post/${posts.elementAt(index).id}');
        },
      ),
    );
  }
}
