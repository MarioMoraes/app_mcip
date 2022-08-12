import 'dart:developer';

import 'package:app_mcip/app/repositories/componente/componente_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../core/exceptions/failure.dart';
import '../../../models/componente_model.dart';

part 'componente_controller.dart';

class ComponenteState {
  const ComponenteState();
}

class ComponenteStateInitial extends ComponenteState {}

class ComponenteStateLoading extends ComponenteState {}

class ComponenteStateLoaded extends ComponenteState {
  final List<ComponenteModel> listMP;

  ComponenteStateLoaded({required this.listMP});

  List<Object> get props => [listMP];
}

class ComponenteStateError extends ComponenteState {}
