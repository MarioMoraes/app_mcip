part of 'login_controller.dart';

enum LoginStatus { initial, loading, failure }

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String? message;

  const LoginState._({
    required this.loginStatus,
    this.message,
  });

  const LoginState.initial() : this._(loginStatus: LoginStatus.initial);

  @override
  List<Object?> get props => [loginStatus, message];

  LoginState copyWith({LoginStatus? loginStatus, String? message}) {
    return LoginState._(
      loginStatus: loginStatus ?? this.loginStatus,
      message: message ?? this.message,
    );
  }
}
