import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/core/exceptions/repository_exception.dart';
import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:app_mcip/app/models/produto_model.dart';
import 'package:app_mcip/app/repositories/products/products_repository.dart';
import 'package:dio/dio.dart';

import '../../core/exceptions/failure.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final dio = Dio();

  @override
  Future<List<LucroRealDetailModel>> getProducts(
    String empresaId,
    String tabelaId,
  ) async {
    try {
      final response = await dio.get(
        'https://23.20.160.129/app/api/lucro-real-detail.php',
        queryParameters: {
          'empresa_id': empresaId,
          'tabela_id': tabelaId,
        },
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);

        return (json as List)
            .map<LucroRealDetailModel>((e) => LucroRealDetailModel.fromMap(e))
            .toList();
      }
    } on Failure catch (e, s) {
      log('Erro Consulta Produtos', error: e.message, stackTrace: s);
    }
    return [];
  }

  @override
  Future<void> savePrice(
    String empresaId,
    String tabelaId,
    String productId,
    String price,
  ) async {
    try {
      final response = await dio.get(
        'https://23.20.160.129/app/api/update-preco.php',
        queryParameters: {
          'empresa_id': empresaId,
          'tabela_id': tabelaId,
          'produto_id': productId,
          'preco_praticado': price,
        },
      );
    } on DioError {
      throw RepositoryException(message: 'Erro ao Atualizar Preco de Venda');
    }
  }

  @override
  Future<List<ProdutoModel>> getProdutos(String empresaId) async {
    try {
      final response = await dio.get(
        'https://23.20.160.129/app/api/produtos.php',
        queryParameters: {
          'empresa_id': empresaId,
        },
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);

        return (json as List)
            .map<ProdutoModel>((e) => ProdutoModel.fromMap(e))
            .toList();
      }
    } on Failure catch (e, s) {
      log('Erro Consulta Produtos', error: e.message, stackTrace: s);
    }
    return [];
  }
}
