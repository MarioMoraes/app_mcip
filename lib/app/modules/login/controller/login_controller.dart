import 'package:app_mcip/app/models/empresa_model.dart';
import 'package:app_mcip/app/models/user_model.dart';
import 'package:bloc/bloc.dart';

import '../../../services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(LoginStateInitial());

  Future<void> signIn(String email, String password, String empresaId) async {
    try {
      emit(LoginStateLoading());
      final logged = await _authService.signIn(email, password, empresaId);
      emit(
          LoginStateLoaded(loginStatus: LoginStatus.success, listCustomer: []));
    } on Exception {
      emit(LoginStateError());
    }
  }

  Future<void> getCustomers() async {
    try {
      emit(LoginStateLoading());
      final listCustomers = await _authService.getCustomers();
      emit(LoginStateLoaded(
          loginStatus: LoginStatus.success, listCustomer: listCustomers));
    } on Exception {
      emit(LoginStateError());
    }
  }

  /*
  void signOut() async {
    await _authService.signOut();
  }
  */
}
