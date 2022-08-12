import 'dart:convert';

class ComponenteModel {
  String empresaId;
  String id;
  String componenteDesc;
  String unidadeId;
  String componenteCustoMp;
  String componenteCustoProcesso;
  String loteQtde;
  String componenteCustoOutros;
  String custoUnitarioTotal;
  String dataUltimaAtualizacaoMp;
  String dataUltimaAtualizacaoProcesso;
  String dataUltimaAtualizacaoOutros;

  ComponenteModel({
    required this.empresaId,
    required this.id,
    required this.componenteDesc,
    required this.unidadeId,
    required this.componenteCustoMp,
    required this.componenteCustoProcesso,
    required this.loteQtde,
    required this.componenteCustoOutros,
    required this.custoUnitarioTotal,
    required this.dataUltimaAtualizacaoMp,
    required this.dataUltimaAtualizacaoProcesso,
    required this.dataUltimaAtualizacaoOutros,
  });

  Map<String, dynamic> toMap() {
    return {
      'empresaId': empresaId,
      'id': id,
      'componenteDesc': componenteDesc,
      'unidadeId': unidadeId,
      'componenteCustoMp': componenteCustoMp,
      'componenteCustoProcesso': componenteCustoProcesso,
      'loteQtde': loteQtde,
      'componenteCustoOutros': componenteCustoOutros,
      'custoUnitarioTotal': custoUnitarioTotal,
      'dataUltimaAtualizacaoMp': dataUltimaAtualizacaoMp,
      'dataUltimaAtualizacaoProcesso': dataUltimaAtualizacaoProcesso,
      'dataUltimaAtualizacaoOutros': dataUltimaAtualizacaoOutros,
    };
  }

  factory ComponenteModel.fromMap(Map<String, dynamic> map) {
    return ComponenteModel(
      empresaId: map['empresa_id'] ?? '',
      id: map['id'] ?? '',
      componenteDesc: map['componente_desc'] ?? '',
      unidadeId: map['unidade_id'] ?? '',
      componenteCustoMp: map['componente_custo_mp'] ?? '',
      componenteCustoProcesso: map['componente_custo_processo'] ?? '',
      loteQtde: map['lote_qtde'] ?? '',
      componenteCustoOutros: map['componente_custo_outros'] ?? '',
      custoUnitarioTotal: map['custo_unitario_total'] ?? '',
      dataUltimaAtualizacaoMp: map['data_ultima_atualizacao_mp'] ?? '',
      dataUltimaAtualizacaoProcesso:
          map['data_ultima_atualizacao_processo'] ?? '',
      dataUltimaAtualizacaoOutros: map['data_ultima_atualizacao_outros'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ComponenteModel.fromJson(String source) =>
      ComponenteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ComponenteModel(empresaId: $empresaId, id: $id, componenteDesc: $componenteDesc, unidadeId: $unidadeId, componenteCustoMp: $componenteCustoMp, componenteCustoProcesso: $componenteCustoProcesso, loteQtde: $loteQtde, componenteCustoOutros: $componenteCustoOutros, custoUnitarioTotal: $custoUnitarioTotal, dataUltimaAtualizacaoMp: $dataUltimaAtualizacaoMp, dataUltimaAtualizacaoProcesso: $dataUltimaAtualizacaoProcesso, dataUltimaAtualizacaoOutros: $dataUltimaAtualizacaoOutros)';
  }
}
