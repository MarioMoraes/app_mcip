import '../../models/lucro_real_detail_model.dart';

abstract class ProductsRepository {
  Future<List<LucroRealDetailModel>> getProducts(
      String empresaId, String tabelaId, String productId);
}
