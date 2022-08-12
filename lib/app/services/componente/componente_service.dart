import 'package:app_mcip/app/models/componente_model.dart';

abstract class ComponenteService {
  Future<List<ComponenteModel>> fetchAll(String empresaId);
}
