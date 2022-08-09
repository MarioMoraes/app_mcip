import 'dart:convert';

class MateriaPrimaModel {
  final String empresaId;
  final String id;
  final String materiaPrima;
  final String custoUnitario;
  final String unidadeId;
  final String dataUltimaAtualizacao;

  MateriaPrimaModel({
    required this.empresaId,
    required this.id,
    required this.materiaPrima,
    required this.custoUnitario,
    required this.unidadeId,
    required this.dataUltimaAtualizacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'empresaId': empresaId,
      'id': id,
      'materiaPrima': materiaPrima,
      'custoUnitario': custoUnitario,
      'unidadeId': unidadeId,
      'dataUltimaAtualizacao': dataUltimaAtualizacao,
    };
  }

  factory MateriaPrimaModel.fromMap(Map<String, dynamic> map) {
    return MateriaPrimaModel(
      empresaId: map['empresa_id'] ?? '',
      id: map['id'] ?? '',
      materiaPrima: map['materia_prima'] ?? '',
      custoUnitario: map['custo_unitario'] ?? '',
      unidadeId: map['unidade_id'] ?? '',
      dataUltimaAtualizacao: map['data_ultima_atualizacao'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MateriaPrimaModel.fromJson(String source) =>
      MateriaPrimaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MateriaPrimaModel(empresaId: $empresaId, id: $id, materiaPrima: $materiaPrima, custoUnitario: $custoUnitario, unidadeId: $unidadeId, dataUltimaAtualizacao: $dataUltimaAtualizacao)';
  }
}
