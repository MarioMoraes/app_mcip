import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import './materia_prima_repository.dart';
import '../../core/exceptions/failure.dart';
import '../../models/materia_prima_model.dart';

class MateriaPrimaRepositoryImpl implements MateriaPrimaRepository {
  final Dio _dio = Dio();

  @override
  Future<List<MateriaPrimaModel>> getMateriaPrima(String empresaId) async {
    try {
      final response = await _dio.get(
          'https://masterbusiness.adm.br/api/materia-prima.php',
          queryParameters: {'id': empresaId});

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);

        final retorno =
            (json as List).map((e) => MateriaPrimaModel.fromJson(e)).toList();

        return retorno;
      }
    } on Failure catch (e, s) {
      log('Erro Consulta Materias Primas', error: e.message, stackTrace: s);
    }
    return [];
  }
}
