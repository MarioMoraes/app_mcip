import 'package:app_mcip/app/models/empresa_model.dart';
import 'package:app_mcip/app/models/user_model.dart';
import 'package:bloc/bloc.dart';

import '../../../core/helpers/singleton.dart';
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
      emit(LoginStateVerifify());
      final user = await _authService.signIn(email, password, empresaId);

      if (user.isNotEmpty) {
        final userSys = user[0];
        if (userSys?.active == 'Y') {
          saveInstance(userSys!);
          emit(LoginStateLogged(
              loginStatus: LoginStatus.success, user: userSys));
        } else {
          emit(LoginStateUserInvalid());
        }
      } else {
        emit(LoginStateUserInvalid());
      }
    } on Exception {
      emit(LoginStateUserInvalid());
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

  saveInstance(UserModel model) {
    var singleton = Singleton.instance;

    singleton.idEmpresa = model.empresaId;
    singleton.nameEmpresa = model.login;
    singleton.emailEmpresa = model.email;
  }
}
