part of 'products_state.dart';

class ProductsController extends Cubit<ProductsState> {
  final ProductsService productsService;

  ProductsController({required this.productsService})
      : super(ProductsStateInitial());

  Future<void> getProducts(
    String empresaId,
    String tabelaId,
  ) async {
    try {
      emit(ProductsStateLoading());

      final response = await productsService.getProducts(empresaId, tabelaId);

      emit(ProductsStateLoaded(lr: response));
    } on Exception {
      Failure();
      emit(ProductsStateError());
    }
  }
}
