import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/lucro_real_model.dart';
import '../../../services/lucro-real/lucro_real_service.dart';

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

class LucroRealStateComplete extends LucroRealState {}

class LucroRealStateError extends LucroRealState {}
