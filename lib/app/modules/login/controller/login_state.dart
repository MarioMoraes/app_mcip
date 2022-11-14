part of 'login_controller.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  LoginState();
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateLoaded extends LoginState {
  final LoginStatus loginStatus;
  final UserModel? user;
  final List<EmpresaModel> listCustomer;

  LoginStateLoaded(
      {required this.loginStatus, this.user, required this.listCustomer});

  List<Object> get props => [loginStatus, user ?? '', listCustomer];
}

class LoginStateError extends LoginState {}
