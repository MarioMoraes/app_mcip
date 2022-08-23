import '../../models/centro_custo_model.dart';

abstract class CentroCustoService {
  Future<List<CentroCustoModel>> getAll(String empresaId);
}
