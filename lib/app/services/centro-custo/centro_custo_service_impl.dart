import 'package:app_mcip/app/models/centro_custo_model.dart';
import 'package:app_mcip/app/repositories/centro-custo/centro_custo_repository.dart';

import './centro_custo_service.dart';

class CentroCustoServiceImpl implements CentroCustoService {
  final CentroCustoRepository _centroCustoRepository;

  const CentroCustoServiceImpl({
    required CentroCustoRepository centroCustoRepository,
  }) : _centroCustoRepository = centroCustoRepository;

  @override
  Future<List<CentroCustoModel>> getAll(String empresaId) =>
      _centroCustoRepository.getAll(empresaId);
}
