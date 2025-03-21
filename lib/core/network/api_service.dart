import 'package:dio/dio.dart';
import 'package:washout/core/constants/app_constants.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  Future<List<dynamic>> getPosts() async {
    final response = await _dio.get('/posts');
    return response.data;
  }

  Future<dynamic> createPost(Map<String, dynamic> post) async {
    final response = await _dio.post('/posts', data: post);
    return response.data;
  }

  Future<dynamic> updatePost(int id, Map<String, dynamic> post) async {
    final response = await _dio.put('/posts/$id', data: post);
    return response.data;
  }

  Future<void> deletePost(int id) async {
    await _dio.delete('/posts/$id');
  }
}