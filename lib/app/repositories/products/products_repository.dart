import 'package:app_mcip/app/models/produto_model.dart';

import '../../models/lucro_real_detail_model.dart';

abstract class ProductsRepository {
  Future<List<LucroRealDetailModel>> getProducts(
    String empresaId,
    String tabelaId,
  );
  Future<void> savePrice(
    String empresaId,
    String tabelaId,
    String productId,
    String price,
  );
  Future<List<ProdutoModel>> getProdutos(
    String empresaId,
  );
}
