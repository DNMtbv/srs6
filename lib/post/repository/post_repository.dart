import 'dart:convert';

import 'package:lab6_posts/models/get_posts.dart';
import 'package:lab6_posts/post/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> getPosts(GetPostEvent event, Emitter<PostState> emit) async {
    emit(LoadingPostState());
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      // любой код кроме 200 считаем ошибкой
      if (response.statusCode != 200) {
        emit(FailurePostState());
        return;
      }
      final List<dynamic> jsonList = jsonDecode(response.body);
      final getPosts = jsonList.map((json) => Posts.fromJson(json)).toList();
      emit(FetchedPostsState(getPosts));
    } catch (e) {
      emit(FailurePostState());
    }
  }
}
