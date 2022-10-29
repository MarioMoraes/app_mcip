import 'dart:convert';

class UserModel {
  String login;
  String pswd;
  String name;
  String email;
  String active;
  String activationCode;
  String privAdmin;
  String empresaId;

  UserModel({
    required this.login,
    required this.pswd,
    required this.name,
    required this.email,
    required this.active,
    required this.activationCode,
    required this.privAdmin,
    required this.empresaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'pswd': pswd,
      'name': name,
      'email': email,
      'active': active,
      'activation_code': activationCode,
      'priv_admin': privAdmin,
      'empresa_id': empresaId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      login: map['login'] ?? '',
      pswd: map['pswd'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      active: map['active'] ?? '',
      activationCode: map['activation_code'] ?? '',
      privAdmin: map['priv_admin'] ?? '',
      empresaId: map['empresa_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
