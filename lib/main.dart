import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:washout/core/routes/app_router.dart';
import 'package:washout/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:washout/presentation/blocs/post_bloc/post_bloc.dart';
import 'package:washout/data/repositories/post_repository.dart';
import 'package:washout/core/network/api_service.dart';

void main() {
  final storage = FlutterSecureStorage();
  final apiService = ApiService();
  final postRepository = PostRepository(apiService);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(storage)),
        BlocProvider(create: (_) => PostBloc(postRepository)),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    ),
  );
}