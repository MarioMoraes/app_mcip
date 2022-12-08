import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

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

  @override
  Future<void> saveData(
    String id,
    String percIcms,
    String percPis,
    String percConfins,
    String percComissao,
    String percFrete,
    String percDespAdm,
    String percDespCom,
    String percDespDir,
    String percDespFin,
    String lucro,
  ) async {
    Intl.defaultLocale = 'en_US';

    num icms = NumberFormat().parse(percIcms) / 100;
    num pis = NumberFormat().parse(percPis) / 100;
    num confins = NumberFormat().parse(percConfins) / 100;
    num comissao = NumberFormat().parse(percComissao) / 100;
    num frete = NumberFormat().parse(percFrete) / 100;
    num adm = NumberFormat().parse(percDespAdm) / 100;
    num com = NumberFormat().parse(percDespCom) / 100;
    num dir = NumberFormat().parse(percDespDir) / 100;
    num fin = NumberFormat().parse(percDespFin) / 100;
    num lucroConverted = NumberFormat().parse(lucro) / 100;

    final response = await _dio.post(
      'https://23.20.160.129/app/api/update-tabela.php?empresa_id=$id&icms=$icms&pis=$pis&confins=$confins&comissao=$comissao&frete=$frete&despesa_adm=$adm&despesa_com=$com&despesa_dir=$dir&despesa_fin=$fin&lucro=$lucroConverted',
    );

    if (response.statusCode != 200) {
      throw Failure();
    }
  }
}
