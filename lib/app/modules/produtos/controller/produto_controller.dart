part of 'produto_state.dart';

class ProdutoController extends Cubit<ProdutoState> {
  final ProductsService _productsService;

  ProdutoController({required ProductsService productsService})
      : _productsService = productsService,
        super(ProdutoStateInitial());

  Future<void> getProdutos(String empresaId) async {
    try {
      emit(ProdutoStateLoading());
      final response = await _productsService.getProdutos(empresaId);
      emit(ProdutoStateLoaded(listLR: response));
    } on Exception {
      emit(ProdutoStateError());
    }
  }
}
