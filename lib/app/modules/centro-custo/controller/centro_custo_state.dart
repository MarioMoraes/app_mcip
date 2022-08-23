part of 'centro_custo_controller.dart';

class CentroCustoState {
  CentroCustoState();
}

class CentroCustoStateInitial extends CentroCustoState {}

class CentroCustoStateLoading extends CentroCustoState {}

class CentroCustoStateLoaded extends CentroCustoState {
  final List<CentroCustoModel> listCC;

  CentroCustoStateLoaded({required this.listCC});

  List<Object> get props => [listCC];
}

class CentroCustoStateError extends CentroCustoState {}
