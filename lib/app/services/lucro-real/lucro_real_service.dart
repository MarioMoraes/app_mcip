import 'package:app_mcip/app/models/lucro_real_model.dart';

abstract class LucroRealService {
  Future<List<LucroRealModel>> getAll(String empresaId);
}
