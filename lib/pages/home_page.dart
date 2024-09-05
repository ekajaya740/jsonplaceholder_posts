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
    final posts = Provider.of<PostsProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: SafeArea(
              child: posts.loading
                  ? const CircularProgressIndicator()
                  : Text(posts.posts.toString()))),
    );
  }
}
