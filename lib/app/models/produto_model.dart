import 'dart:convert';

class ProdutoModel {
  String empresaId;
  String id;
  String produto;
  String unidadeId;
  String custoMp;
  String custoCp;
  String custoProcesso;
  String loteQtde;
  String custoTotalLote;
  String custoOutros;
  String custoPorUnidade;
  String dataUltimaAtualizacaoMp;
  String dataUltimaAtualizacaoCp;
  String dataUltimaAtualizacaoProcesso;
  String dataUltimaAtualizacaoOutros;

  ProdutoModel({
    required this.empresaId,
    required this.id,
    required this.produto,
    required this.unidadeId,
    required this.custoMp,
    required this.custoCp,
    required this.custoProcesso,
    required this.loteQtde,
    required this.custoTotalLote,
    required this.custoOutros,
    required this.custoPorUnidade,
    required this.dataUltimaAtualizacaoMp,
    required this.dataUltimaAtualizacaoCp,
    required this.dataUltimaAtualizacaoProcesso,
    required this.dataUltimaAtualizacaoOutros,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'empresa_id': empresaId,
      'id': id,
      'produto': produto,
      'unidade_id': unidadeId,
      'custo_mp': custoMp,
      'custo_cp': custoCp,
      'custo_processo': custoProcesso,
      'lote_qtde': loteQtde,
      'custo_total_lote': custoTotalLote,
      'custo_outros': custoOutros,
      'custo_por_unidade': custoPorUnidade,
      'data_ultima_atualizacao_mp': dataUltimaAtualizacaoMp,
      'data_ultima_atualizacao_cp': dataUltimaAtualizacaoCp,
      'data_ultima_atualizacao_processo': dataUltimaAtualizacaoProcesso,
      'data_ultima_atualizacao_outros': dataUltimaAtualizacaoOutros,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      empresaId: map['empresa_id'] as String,
      id: map['id'] as String,
      produto: map['produto'] as String,
      unidadeId: map['unidade_id'] as String,
      custoMp: map['custo_mp'] as String,
      custoCp: map['custo_cp'] as String,
      custoProcesso: map['custo_processo'] as String,
      loteQtde: map['lote_qtde'] as String,
      custoTotalLote: map['custo_total_lote'] as String,
      custoOutros: map['custo_outros'] as String,
      custoPorUnidade: map['custo_por_unidade'] as String,
      dataUltimaAtualizacaoMp: map['data_ultima_atualizacao_mp'] as String,
      dataUltimaAtualizacaoCp: map['data_ultima_atualizacao_cp'] as String,
      dataUltimaAtualizacaoProcesso:
          map['data_ultima_atualizacao_processo'] as String,
      dataUltimaAtualizacaoOutros:
          map['data_ultima_atualizacao_outros'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
