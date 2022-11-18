// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/models/empresa_model.dart';
import 'package:app_mcip/app/models/user_model.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';
import '../../core/exceptions/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final dio = Dio();

  @override
  Future<List<UserModel?>> signIn(
      String email, String password, String empresaId) async {
    try {
      var bytes = utf8.encode(password);
      var digest = md5.convert(bytes);

      final response = await dio.get(
        'https://23.20.160.129/app/api/user.php',
        queryParameters: {
          'id': empresaId,
          'login': email,
          'password': digest,
        },
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        if (json != null) {
          return (json as List).map((e) => UserModel.fromMap(e)).toList();
        } else {
          throw Exception();
        }
      }
      throw Exception();
    } on Failure catch (e, s) {
      log('Erro Consulta User', error: e.message, stackTrace: s);
      throw Exception();
    }
  }

  @override
  Future<List<EmpresaModel>> getCustomers() async {
    try {
      final response =
          await dio.get('https://23.20.160.129/app/api/empresa.php');

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        return (json as List).map((e) => EmpresaModel.fromMap(e)).toList();
      }
    } on DioError catch (e, s) {
      log('Error ao Buscar Empresas', error: e, stackTrace: s);
      throw Failure();
    }
    return [];
  }
}
