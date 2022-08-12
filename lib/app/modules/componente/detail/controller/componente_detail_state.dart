import 'package:app_mcip/app/repositories/componente/componente_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../../models/componente_model.dart';

part 'componente_detail_controller.dart';

class ComponenteDetailState {
  const ComponenteDetailState();
}

class ComponenteDetailStateInitial extends ComponenteDetailState {}

class ComponenteDetailStateLoading extends ComponenteDetailState {}

class ComponenteDetailStateLoaded extends ComponenteDetailState {
  final List<ComponenteModel> listMP;

  ComponenteDetailStateLoaded({required this.listMP});

  List<Object> get props => [listMP];
}

class ComponenteDetailStateError extends ComponenteDetailState {}
