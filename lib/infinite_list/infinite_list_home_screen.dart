import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/counter/view/counter_page.dart';
import 'package:flutter_bloc_examples/infinite_list/posts/view/posts_page.dart';

class InfiniteListHomeScreen extends StatelessWidget {
  const InfiniteListHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PostsPage(),
      ),
    );
  }
}
