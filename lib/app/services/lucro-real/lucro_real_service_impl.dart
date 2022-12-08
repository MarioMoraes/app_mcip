import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:app_mcip/app/repositories/lucro-real/lucro_real_repository.dart';

import './lucro_real_service.dart';

class LucroRealServiceImpl implements LucroRealService {
  final LucroRealRepository _lucroRealRepository;

  LucroRealServiceImpl({
    required LucroRealRepository lucroRealRepository,
  }) : _lucroRealRepository = lucroRealRepository;

  @override
  Future<List<LucroRealModel>> getAll(String empresaId) =>
      _lucroRealRepository.getAll(empresaId);

  @override
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
          String lucro) =>
      _lucroRealRepository.saveData(
          id,
          percIcms,
          percPis,
          percConfins,
          percComissao,
          percFrete,
          percDespAdm,
          percDespCom,
          percDespDir,
          percDespFin,
          lucro);
}
