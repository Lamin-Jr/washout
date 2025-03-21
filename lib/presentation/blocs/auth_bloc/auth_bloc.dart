import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:washout/core/constants/app_constants.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage _storage;

  AuthBloc(this._storage) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    if (event.username == AppConstants.loginUsername && event.password == AppConstants.loginPassword) {
      await _storage.write(key: 'token', value: 'fake_token');
      final token = await _storage.read(key: 'token');
      print('Token saved: $token');
      emit(AuthAuthenticated());
    } else {
      emit(AuthError('Invalid credentials'));
    }
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await _storage.delete(key: 'token');
    emit(AuthUnauthenticated());
  }
}