import 'package:app_mcip/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser(String empresaId, String login);
}
