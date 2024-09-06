import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/providers/posts_provider.dart';
import 'package:jsonplaceholder_posts/widgets/lists/posts_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostsProvider>(context, listen: false).requestPosts();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PostsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: data.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: PostsList(posts: data.posts)),
      ),
    );
  }
}
