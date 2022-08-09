import '../../models/materia_prima_model.dart';

abstract class MateriaPrimaService {
  Future<List<MateriaPrimaModel>> getMateriaPrima(String empresaId);
}
