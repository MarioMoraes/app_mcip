// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:app_mcip/app/models/produto_model.dart';
import 'package:app_mcip/app/repositories/products/products_repository.dart';
import 'package:app_mcip/app/services/products/products_service.dart';

class ProductsServiceImpl extends ProductsService {
  final ProductsRepository _productsRepository;

  ProductsServiceImpl({
    required ProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  @override
  Future<List<LucroRealDetailModel>> getProducts(
          String empresaId, String tabelaId) =>
      _productsRepository.getProducts(empresaId, tabelaId);

  @override
  Future<void> savePrice(
          String empresaId, String tabelaId, String productId, String price) =>
      _productsRepository.savePrice(empresaId, tabelaId, productId, price);

  @override
  Future<List<ProdutoModel>> getProdutos(String empresaId) async =>
      _productsRepository.getProdutos(empresaId);
}
