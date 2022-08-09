import './auth_service.dart';
import '../../repositories/auth/auth_repository.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;

  AuthServiceImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> signIn(String email, String password) =>
      _authRepository.signIn(email, password);
}
