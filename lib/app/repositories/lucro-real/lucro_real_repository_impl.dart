import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:dio/dio.dart';

import './lucro_real_repository.dart';
import '../../core/exceptions/failure.dart';

class LucroRealRepositoryImpl implements LucroRealRepository {
  final Dio _dio = Dio();

  @override
  Future<List<LucroRealModel>> getAll(String empresaId) async {
    try {
      final response = await _dio.get(
        'https://23.20.160.129/app/api/lucro-real.php',
        queryParameters: {'id': empresaId},
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);

        return (json as List).map((e) => LucroRealModel.fromMap(e)).toList();
      }
    } on Failure catch (e, s) {
      log('Erro Consulta Componentes', error: e.message, stackTrace: s);
    }
    return [];
  }
}
