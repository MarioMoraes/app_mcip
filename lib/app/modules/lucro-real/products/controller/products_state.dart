import 'package:app_mcip/app/core/exceptions/failure.dart';
import 'package:app_mcip/app/services/products/products_service.dart';
import 'package:bloc/bloc.dart';

import '../../../../models/lucro_real_detail_model.dart';

part 'products_controller.dart';

class ProductsState {
  ProductsState();
}

class ProductsStateInitial extends ProductsState {}

class ProductsStateLoading extends ProductsState {}

class ProductsStateComplete extends ProductsState {}

class ProductsStateLoaded extends ProductsState {
  List<LucroRealDetailModel> lr;

  ProductsStateLoaded({required this.lr});

  List<Object> get props => [lr];
}

class ProductsStateError extends ProductsState {}
