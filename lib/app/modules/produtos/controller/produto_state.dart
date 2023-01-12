import 'package:app_mcip/app/services/products/products_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/produto_model.dart';

part 'produto_controller.dart';

class ProdutoState {
  const ProdutoState();
}

class ProdutoStateInitial extends ProdutoState {}

class ProdutoStateLoading extends ProdutoState {}

class ProdutoStateLoaded extends ProdutoState {
  List<ProdutoModel> listLR;

  ProdutoStateLoaded({required this.listLR});

  List<Object> get props => [listLR];
}

class ProdutoStateComplete extends ProdutoState {}

class ProdutoStateError extends ProdutoState {}
