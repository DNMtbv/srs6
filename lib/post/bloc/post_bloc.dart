import 'package:equatable/equatable.dart';
import 'package:lab6_posts/models/get_posts.dart';
import 'package:lab6_posts/post/repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _repository = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>(_repository.getPosts);
  }
}
