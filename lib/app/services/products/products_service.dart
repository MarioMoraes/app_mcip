import 'package:app_mcip/app/models/lucro_real_detail_model.dart';

abstract class ProductsService {
  Future<List<LucroRealDetailModel>> getProducts(
      String empresaId, String tabelaId);
}