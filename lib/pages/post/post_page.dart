import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/providers/posts_provider.dart';
import 'package:jsonplaceholder_posts/widgets/lists/comments_list.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.id});

  final int id;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostsProvider>(context, listen: false)
        .requestPostById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PostsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: data.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.post.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.post.body,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Text(
                            "Comments",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(data.comments.length.toString()),
                        ],
                      ),
                      const Divider(),
                      CommentsList(comments: data.comments),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
