import 'package:washout/core/network/api_service.dart';
import 'package:washout/data/models/post_model.dart';

class PostRepository {
  final ApiService _apiService;

  PostRepository(this._apiService);

  Future<List<Post>> getPosts() async {
    final posts = await _apiService.getPosts();
    return posts.map((post) => Post.fromJson(post)).toList();
  }

  Future<Post> createPost(Post post) async {
    final response = await _apiService.createPost(post.toJson());
    return Post.fromJson(response);
  }

  Future<Post> updatePost(int id, Post post) async {
    final response = await _apiService.updatePost(id, post.toJson());
    return Post.fromJson(response);
  }

  Future<void> deletePost(int id) async {
    await _apiService.deletePost(id);
  }
}