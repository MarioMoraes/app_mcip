part of 'lucro_real_state.dart';

class LucroRealController extends Cubit<LucroRealState> {
  final LucroRealService _lucroRealService;

  LucroRealController({required LucroRealService lucroRealService})
      : _lucroRealService = lucroRealService,
        super(LucroRealStateInitial());

  Future<void> fetchAll(String empresaId) async {
    emit(LucroRealStateLoading());
    var listLR = await _lucroRealService.getAll(empresaId);
    emit(LucroRealStateLoaded(listLR: listLR));
  }
}
