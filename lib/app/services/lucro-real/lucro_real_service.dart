import 'package:app_mcip/app/models/lucro_real_model.dart';

abstract class LucroRealService {
  Future<List<LucroRealModel>> getAll(String empresaId);
  Future<void> saveData(
    String id,
    String percIcms,
    String percPis,
    String percConfins,
    String percComissao,
    String percFrete,
    String percDespAdm,
    String percDespCom,
    String percDespDir,
    String percDespFin,
    String lucro,
  );
}
