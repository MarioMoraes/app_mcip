part of 'materia_prima_detail_state.dart';

class MateriaPrimaDetailController extends Cubit<MateriaPrimaDetailState> {
  final MateriaPrimaRepository _materiaPrimaRepository;

  MateriaPrimaDetailController(
      {required MateriaPrimaRepository materiaPrimaRepository})
      : _materiaPrimaRepository = materiaPrimaRepository,
        super(MateriaPrimaDetailStateInitial());

  Future<void> updatePrice(
      String empresaId, String id, String custoUnitario) async {
    emit(MateriaPrimaDetailStateLoading());
    await _materiaPrimaRepository.updatePrice(empresaId, id, custoUnitario);
    emit(MateriaPrimaDetailStateLoaded());
  }
}
