import 'dart:developer';

import 'package:app_mcip/app/repositories/materia-prima/materia_prima_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../core/exceptions/failure.dart';
import '../../../models/materia_prima_model.dart';

part 'materia_prima_controller.dart';

class MateriaPrimaState {
  const MateriaPrimaState();
}

class MateriaPrimaStateInitial extends MateriaPrimaState {}

class MateriaPrimaStateLoading extends MateriaPrimaState {}

class MateriaPrimaStateLoaded extends MateriaPrimaState {
  final List<MateriaPrimaModel> listMP;

  MateriaPrimaStateLoaded({required this.listMP});

  List<Object> get props => [listMP];
}

class MateriaPrimaStateError extends MateriaPrimaState {}
