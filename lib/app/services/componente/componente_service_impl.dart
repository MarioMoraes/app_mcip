import 'package:app_mcip/app/models/componente_model.dart';
import 'package:app_mcip/app/repositories/componente/componente_repository.dart';

import './componente_service.dart';

class ComponenteServiceImpl implements ComponenteService {
  final ComponenteRepository _componenteRepository;

  ComponenteServiceImpl({
    required ComponenteRepository componenteRepository,
  }) : _componenteRepository = componenteRepository;

  @override
  Future<List<ComponenteModel>> fetchAll(String empresaId) =>
      _componenteRepository.fetchAll(empresaId);
}
