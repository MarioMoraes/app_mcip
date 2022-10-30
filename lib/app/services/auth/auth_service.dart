import 'package:app_mcip/app/models/user_model.dart';

abstract class AuthService {
  Future<UserModel?> signIn(String email, String password);
}
