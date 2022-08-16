import '../../models/materia_prima_model.dart';

abstract class MateriaPrimaRepository {
  Future<List<MateriaPrimaModel>> getMateriaPrima(String empresaId);
  Future<void> updatePrice(String empresaId, String id, String custoUnitario);
}
