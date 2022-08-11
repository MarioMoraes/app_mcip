part of 'materia_prima_detail_state.dart';

class MateriaPrimaDetailController extends Cubit<MateriaPrimaDetailState> {
  final MateriaPrimaRepository materiaPrimaRepository;

  MateriaPrimaDetailController({required this.materiaPrimaRepository})
      : super(MateriaPrimaDetailStateInitial());
}
