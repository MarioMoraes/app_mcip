part of 'componente_detail_state.dart';

class ComponenteDetailController extends Cubit<ComponenteDetailState> {
  final ComponenteRepository _componenteRepository;

  ComponenteDetailController(
      {required ComponenteRepository componenteRepository})
      : _componenteRepository = componenteRepository,
        super(ComponenteDetailStateInitial());
}
