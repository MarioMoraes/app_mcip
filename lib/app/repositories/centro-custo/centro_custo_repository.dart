import 'package:app_mcip/app/models/centro_custo_model.dart';

abstract class CentroCustoRepository {
  Future<List<CentroCustoModel>> getAll(String empresaId);
}
