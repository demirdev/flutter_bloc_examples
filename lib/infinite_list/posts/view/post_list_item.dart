import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/infinite_list/posts/models/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem(this.post, {Key? key}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text(
        '${post.id}',
        style: textTheme.caption,
      ),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}
