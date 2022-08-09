part of 'materia_prima_state.dart';

class MateriaPrimaController extends Cubit<MateriaPrimaState> {
  final MateriaPrimaRepository repository;

  MateriaPrimaController({required this.repository})
      : super(MateriaPrimaStateInitial());

  Future<void> fetchAll(String empresaId) async {
    emit(MateriaPrimaStateLoading());

    try {
      final list = await repository.getMateriaPrima(empresaId);
      emit(MateriaPrimaStateLoaded(listMP: list));
    } on Failure catch (e, s) {
      log('Erro Consulta Materias Primas', error: e.message, stackTrace: s);
      emit(MateriaPrimaStateError());
    }
  }
}
