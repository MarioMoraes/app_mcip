import './materia_prima_service.dart';
import '../../models/materia_prima_model.dart';
import '../../repositories/materia-prima/materia_prima_repository.dart';

class MateriaPrimaServiceImpl implements MateriaPrimaService {
  final MateriaPrimaRepository _materiaPrimaRepository;

  MateriaPrimaServiceImpl({
    required MateriaPrimaRepository materiaPrimaRepository,
  }) : _materiaPrimaRepository = materiaPrimaRepository;

  @override
  Future<List<MateriaPrimaModel>> getMateriaPrima(String empresaId) =>
      _materiaPrimaRepository.getMateriaPrima(empresaId);
}
