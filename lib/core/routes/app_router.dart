import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:washout/presentation/screens/login_screen.dart';
import 'package:washout/presentation/screens/home_screen.dart';

final storage = FlutterSecureStorage();

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
      redirect: (context, state) async {
        final token = await storage.read(key: 'token');
        return token == null ? '/' : null;
      },
    ),
  ],
);