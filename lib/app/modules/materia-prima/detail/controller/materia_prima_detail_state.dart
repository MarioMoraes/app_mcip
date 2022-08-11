import 'package:bloc/bloc.dart';

import '../../../../repositories/materia-prima/materia_prima_repository.dart';

part 'materia_prima_detail_controller.dart';

class MateriaPrimaDetailState {
  const MateriaPrimaDetailState();
}

class MateriaPrimaDetailStateInitial extends MateriaPrimaDetailState {}

class MateriaPrimaDetailStateLoading extends MateriaPrimaDetailState {}

class MateriaPrimaDetailStateLoaded extends MateriaPrimaDetailState {}

class MateriaPrimaDetailStateError extends MateriaPrimaDetailState {}
