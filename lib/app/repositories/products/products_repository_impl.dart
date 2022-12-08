import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:app_mcip/app/repositories/products/products_repository.dart';
import 'package:dio/dio.dart';

import '../../core/exceptions/failure.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final dio = Dio();

  @override
  Future<List<LucroRealDetailModel>> getProducts(
    String empresaId,
    String tabelaId,
    String productId,
  ) async {
    try {
      final response = await dio.get(
        'https://23.20.160.129/app/api/lucro-real-detail.php',
        queryParameters: {
          'id': empresaId,
          'tabela_id': tabelaId,
          'produto_id': productId
        },
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);

        return (json as List)
            .map((e) => LucroRealDetailModel.fromMap(e))
            .toList();
      }
    } on Failure catch (e, s) {
      log('Erro Consulta Produtos', error: e.message, stackTrace: s);
    }
    return [];
  }
}
