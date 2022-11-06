import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/models/componente_model.dart';
import 'package:dio/dio.dart';

import './componente_repository.dart';
import '../../core/exceptions/failure.dart';

class ComponenteRepositoryImpl implements ComponenteRepository {
  final Dio _dio = Dio();

  @override
  Future<List<ComponenteModel>> fetchAll(String empresaId) async {
    try {
      final response = await _dio.get(
        'https://23.20.160.129/app/api/componentes.php',
        queryParameters: {'id': empresaId},
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);

        return (json as List).map((e) => ComponenteModel.fromMap(e)).toList();
      }
    } on Failure catch (e, s) {
      log('Erro Consulta Componentes', error: e.message, stackTrace: s);
    }
    return [];
  }
}
