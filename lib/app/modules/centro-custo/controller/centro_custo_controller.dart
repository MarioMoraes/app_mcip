import 'package:app_mcip/app/repositories/centro-custo/centro_custo_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../models/centro_custo_model.dart';

part 'centro_custo_state.dart';

class CentroCustoController extends Cubit<CentroCustoState> {
  final CentroCustoRepository _centroCustoRepository;

  CentroCustoController({required CentroCustoRepository centroCustoRepository})
      : _centroCustoRepository = centroCustoRepository,
        super(CentroCustoStateInitial());

  Future<void> fetchAll(String empresaId) async {
    emit(CentroCustoStateLoading());
    var listCC = await _centroCustoRepository.getAll(empresaId);
    emit(CentroCustoStateLoaded(listCC: listCC));
  }
}
