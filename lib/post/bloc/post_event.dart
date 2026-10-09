part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

// событие: загрузить посты
final class GetPostEvent extends PostEvent {}
