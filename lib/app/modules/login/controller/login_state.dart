part of 'login_controller.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  LoginState();
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateLoginCheck extends LoginState {}

class LoginStateLoginChecked extends LoginState {
  final LoginStatus loginStatus;
  final UserModel? user;

  LoginStateLoginChecked({required this.loginStatus, this.user});

  List<Object> get props => [loginStatus, user ?? ''];
}

class LoginStateLoaded extends LoginState {
  final LoginStatus loginStatus;
  final List<EmpresaModel> listCustomer;

  LoginStateLoaded({required this.loginStatus, required this.listCustomer});

  List<Object> get props => [loginStatus, listCustomer];
}

class LoginStateError extends LoginState {}

class LoginStateUserInvalid extends LoginState {}
