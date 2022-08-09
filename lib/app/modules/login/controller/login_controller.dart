import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/services/auth/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn(String email, String password) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      await _authService.signIn(email, password);
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
