import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_examples/infinite_list/posts/bloc/post_event.dart';
import 'package:flutter_bloc_examples/infinite_list/posts/bloc/post_state.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import 'post_event_transformer.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _postLimit = 20;

  PostBloc({required this.httpClient})
      : super(PostState(
            status: PostStatus.initial, posts: [], hasReachedMax: false)) {
    on<PostFetched>(_onPostFetched, transformer: throttleDroppable());
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(state.copyWith(
            status: PostStatus.success, posts: posts, hasReachedMax: false));
      }
      final posts = await _fetchPosts(state.posts.length);
      emit(posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'}));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      return body
          .map((e) => Post(
              id: e['id'] as int,
              title: e['title'] as String,
              body: e['body'] as String))
          .toList();
    }
    throw Exception('error fetching posts');
  }
}
