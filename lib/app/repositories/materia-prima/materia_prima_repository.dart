import '../../models/materia_prima_model.dart';

abstract class MateriaPrimaRepository {
  Future<List<MateriaPrimaModel>> getMateriaPrima(String empresaId);
}
