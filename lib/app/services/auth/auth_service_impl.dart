import 'package:app_mcip/app/models/empresa_model.dart';
import 'package:app_mcip/app/models/user_model.dart';

import './auth_service.dart';
import '../../repositories/auth/auth_repository.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;

  AuthServiceImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel?> signIn(String email, String password, String empresaId) =>
      _authRepository.signIn(email, password, empresaId);

  @override
  Future<List<EmpresaModel>> getCustomers() => _authRepository.getCustomers();
}
