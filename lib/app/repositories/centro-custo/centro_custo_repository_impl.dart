import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/models/centro_custo_model.dart';
import 'package:dio/dio.dart';

import './centro_custo_repository.dart';
import '../../core/exceptions/failure.dart';

class CentroCustoRepositoryImpl implements CentroCustoRepository {
  final Dio _dio = Dio();

  @override
  Future<List<CentroCustoModel>> getAll(String empresaId) async {
    try {
      final response = await _dio.get(
        'https://masterbusiness.adm.br/api/centro-custo.php',
        queryParameters: {'id': empresaId},
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);

        return (json as List).map((e) => CentroCustoModel.fromMap(e)).toList();
      }
    } on Failure catch (e, s) {
      log('Erro Consulta Componentes', error: e.message, stackTrace: s);
    }
    return [];
  }
}
