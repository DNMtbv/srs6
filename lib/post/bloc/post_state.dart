part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

// начальное состояние
final class PostInitial extends PostState {}

// идёт загрузка
final class LoadingPostState extends PostState {}

// посты успешно загружены
final class FetchedPostsState extends PostState {
  final List<Posts> posts;
  const FetchedPostsState(this.posts);

  @override
  List<Object> get props => [posts];
}

// ошибка загрузки
final class FailurePostState extends PostState {}
