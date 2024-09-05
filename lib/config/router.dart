import 'package:go_router/go_router.dart';
import 'package:jsonplaceholder_posts/pages/home_page.dart';
import 'package:jsonplaceholder_posts/pages/post/post_page.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomePage()),
  GoRoute(
    path: '/post/:id',
    builder: (context, state) => const PostPage(),
  )
]);
