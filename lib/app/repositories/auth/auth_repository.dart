import 'package:app_mcip/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> signIn(String email, String password, String empresaId);
}
