part of 'login_controller.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String? message;
  final UserModel? user;

  const LoginState._({
    this.user,
    required this.loginStatus,
    this.message,
  });

  const LoginState.initial() : this._(loginStatus: LoginStatus.initial);

  @override
  List<Object?> get props => [loginStatus, message, user];

  LoginState copyWith(
      {LoginStatus? loginStatus, String? message, UserModel? user}) {
    return LoginState._(
      user: user ?? this.user,
      loginStatus: loginStatus ?? this.loginStatus,
      message: message ?? this.message,
    );
  }
}
