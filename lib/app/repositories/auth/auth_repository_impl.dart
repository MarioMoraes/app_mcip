// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:app_mcip/app/models/user_model.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';
import '../../core/exceptions/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;

  AuthRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<UserModel?> signIn(String email, String password) async {
    try {
      final response = await _dio.get(
        'https://masterbusiness.adm.br/api/user.php',
        queryParameters: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        return UserModel.fromMap(json);
      }
    } on Failure catch (e, s) {
      log('Erro Consulta User', error: e.message, stackTrace: s);
      throw Exception();
    }
    return null;
  }
}
