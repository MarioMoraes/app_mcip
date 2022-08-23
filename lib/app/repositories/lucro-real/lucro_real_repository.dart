import 'package:app_mcip/app/models/lucro_real_model.dart';

abstract class LucroRealRepository {
  Future<List<LucroRealModel>> getAll(String empresaId);
}
