import 'dart:developer';

import 'package:app_mcip/app/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn(String email, String password, String empresaId) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading, user: null));
      final response = await _authService.signIn(email, password, empresaId);
      emit(state.copyWith(loginStatus: LoginStatus.success, user: response));
    } catch (e, s) {
      log('Erro Ao Realizar Login no Google', error: e, stackTrace: s);
      emit(state.copyWith(
          loginStatus: LoginStatus.failure,
          message: 'Erro Ao Realizar Login Google'));
    }
  }

  /*
  void signOut() async {
    await _authService.signOut();
  }
  */
}
