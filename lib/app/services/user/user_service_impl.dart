// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_mcip/app/models/user_model.dart';
import 'package:app_mcip/app/repositories/user/user_repository.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;

  UserServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> getUser(String empresaId, String login) =>
      _userRepository.getUser(empresaId, login);
}
