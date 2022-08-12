import 'package:app_mcip/app/models/componente_model.dart';

abstract class ComponenteRepository {
  Future<List<ComponenteModel>> fetchAll(String empresaId);
}
