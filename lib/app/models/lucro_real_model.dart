import 'dart:convert';

class LucroRealModel {
  String empresaId;
  String id;
  String simulacao;
  String observacao;
  String dataSimulacao;
  String percIcms;
  String percPis;
  String percCofins;
  String percComissao;
  String percFrete;
  String percDespAdministrativa;
  String percDespComercial;
  String percDespDiretoria;
  String percDespFinanceira;
  String percLucroLiquido;
  String percentualTotal;
  String margem;
  String markup;

  LucroRealModel({
    required this.empresaId,
    required this.id,
    required this.simulacao,
    required this.observacao,
    required this.dataSimulacao,
    required this.percIcms,
    required this.percPis,
    required this.percCofins,
    required this.percComissao,
    required this.percFrete,
    required this.percDespAdministrativa,
    required this.percDespComercial,
    required this.percDespDiretoria,
    required this.percDespFinanceira,
    required this.percLucroLiquido,
    required this.percentualTotal,
    required this.margem,
    required this.markup,
  });

  Map<String, dynamic> toMap() {
    return {
      'empresaId': empresaId,
      'id': id,
      'simulacao': simulacao,
      'observacao': observacao,
      'dataSimulacao': dataSimulacao,
      'percIcms': percIcms,
      'percPis': percPis,
      'percCofins': percCofins,
      'percComissao': percComissao,
      'percFrete': percFrete,
      'percDespAdministrativa': percDespAdministrativa,
      'percDespComercial': percDespComercial,
      'percDespDiretoria': percDespDiretoria,
      'percDespFinanceira': percDespFinanceira,
      'percLucroLiquido': percLucroLiquido,
      'percentualTotal': percentualTotal,
      'margem': margem,
      'markup': markup,
    };
  }

  factory LucroRealModel.fromMap(Map<String, dynamic> map) {
    return LucroRealModel(
      empresaId: map['empresa_id'] ?? '',
      id: map['id'] ?? '',
      simulacao: map['simulacao'] ?? '',
      observacao: map['observacao'] ?? '',
      dataSimulacao: map['data_simulacao'],
      percIcms: map['perc_icms'] ?? '',
      percPis: map['perc_pis'] ?? '',
      percCofins: map['perc_cofins'] ?? '',
      percComissao: map['perc_comissao'] ?? '',
      percFrete: map['perc_frete'] ?? '',
      percDespAdministrativa: map['perc_desp_administrativa'] ?? '',
      percDespComercial: map['perc_desp_comercial'] ?? '',
      percDespDiretoria: map['perc_desp_diretoria'] ?? '',
      percDespFinanceira: map['perc_desp_financeira'] ?? '',
      percLucroLiquido: map['perc_lucro_liquido'] ?? '',
      percentualTotal: map['percentual_total'] ?? '',
      margem: map['margem'] ?? '',
      markup: map['markup'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LucroRealModel.fromJson(String source) =>
      LucroRealModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LucroRealModel(empresaId: $empresaId, id: $id, simulacao: $simulacao, observacao: $observacao, dataSimulacao: $dataSimulacao, percIcms: $percIcms, percPis: $percPis, percCofins: $percCofins, percComissao: $percComissao, percFrete: $percFrete, percDespAdministrativa: $percDespAdministrativa, percDespComercial: $percDespComercial, percDespDiretoria: $percDespDiretoria, percDespFinanceira: $percDespFinanceira, percLucroLiquido: $percLucroLiquido, percentualTotal: $percentualTotal, margem: $margem, markup: $markup)';
  }
}
