import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:app_mcip/app/services/lucro-real/lucro_real_service.dart';
import 'package:bloc/bloc.dart';

part 'lucro_real_controller.dart';

class LucroRealState {
  LucroRealState();
}

class LucroRealStateInitial extends LucroRealState {}

class LucroRealStateLoading extends LucroRealState {}

class LucroRealStateLoaded extends LucroRealState {
  List<LucroRealModel> listLR;

  LucroRealStateLoaded({required this.listLR});

  List<Object> get props => [listLR];
}

class LucroRealStateError extends LucroRealState {}
