import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/widgets/lists/posts_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: PostsList()),
    );
  }
}
