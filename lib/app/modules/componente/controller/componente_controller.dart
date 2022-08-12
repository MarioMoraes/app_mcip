part of 'componente_state.dart';

class ComponenteController extends Cubit<ComponenteState> {
  final ComponenteRepository _componenteRepository;

  ComponenteController({required ComponenteRepository componenteRepository})
      : _componenteRepository = componenteRepository,
        super(ComponenteStateInitial());

  Future<void> fetchAll(String empresaId) async {
    emit(ComponenteStateLoading());

    try {
      final list = await _componenteRepository.fetchAll(empresaId);
      emit(ComponenteStateLoaded(listMP: list));
    } on Failure catch (e, s) {
      log('Erro Consulta Materias Primas', error: e.message, stackTrace: s);
      emit(ComponenteStateError());
    }
  }
}
