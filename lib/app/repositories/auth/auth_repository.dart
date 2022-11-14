import 'package:app_mcip/app/models/empresa_model.dart';
import 'package:app_mcip/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> signIn(String email, String password, String empresaId);
  Future<List<EmpresaModel>> getCustomers();
}
