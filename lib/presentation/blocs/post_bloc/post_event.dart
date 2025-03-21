part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPosts extends PostEvent {}
class CreatePost extends PostEvent {
  final Post post;
  CreatePost(this.post);

  @override
  List<Object?> get props => [post];
}
class UpdatePost extends PostEvent {
  final int id;
  final Post post;
  UpdatePost(this.id, this.post);

  @override
  List<Object?> get props => [id, post];
}
class DeletePost extends PostEvent {
  final int id;
  DeletePost(this.id);

  @override
  List<Object?> get props => [id];
}