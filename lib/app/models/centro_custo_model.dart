import 'dart:convert';

class CentroCustoModel {
  String empresaId;
  String id;
  String centroCusto;
  String tipoCentroCustoId;
  String custoUnitarioCc;
  String unidadeId;
  String dataAtualizacao;
  String valorHorasNormais;
  String valorHorasExtras;
  String periculosidade;
  String insalubridade;
  String valorEncargosSociais;
  String despesasManutencao;
  String materialConsumo;
  String aluguelRateado;
  String energiaRateada;
  String depreciacaoBens;
  String outrasDespesas;
  String totalCustoDireto;
  String totalRateiosRecebidos;
  String totalCustoComRateios;
  String hrsTotaisPagas;
  String minTotaisPagos;
  String hrsAfastamento;
  String minAfastamento;
  String hrsTrabalhadas;
  String minTrabalhados;
  String taxaOcupacaoCc;
  String hrsExtras;
  String minExtras;
  String custoAutomatico;
  String custoUnitarioCcAuto;
  String hrsDisponiveis;
  String minDisponiveis;

  CentroCustoModel({
    required this.empresaId,
    required this.id,
    required this.centroCusto,
    required this.tipoCentroCustoId,
    required this.custoUnitarioCc,
    required this.unidadeId,
    required this.dataAtualizacao,
    required this.valorHorasNormais,
    required this.valorHorasExtras,
    required this.periculosidade,
    required this.insalubridade,
    required this.valorEncargosSociais,
    required this.despesasManutencao,
    required this.materialConsumo,
    required this.aluguelRateado,
    required this.energiaRateada,
    required this.depreciacaoBens,
    required this.outrasDespesas,
    required this.totalCustoDireto,
    required this.totalRateiosRecebidos,
    required this.totalCustoComRateios,
    required this.hrsTotaisPagas,
    required this.minTotaisPagos,
    required this.hrsAfastamento,
    required this.minAfastamento,
    required this.hrsTrabalhadas,
    required this.minTrabalhados,
    required this.taxaOcupacaoCc,
    required this.hrsExtras,
    required this.minExtras,
    required this.custoAutomatico,
    required this.custoUnitarioCcAuto,
    required this.hrsDisponiveis,
    required this.minDisponiveis,
  });

  Map<String, dynamic> toMap() {
    return {
      'empresaId': empresaId,
      'id': id,
      'centroCusto': centroCusto,
      'tipoCentroCustoId': tipoCentroCustoId,
      'custoUnitarioCc': custoUnitarioCc,
      'unidadeId': unidadeId,
      'dataAtualizacao': dataAtualizacao,
      'valorHorasNormais': valorHorasNormais,
      'valorHorasExtras': valorHorasExtras,
      'periculosidade': periculosidade,
      'insalubridade': insalubridade,
      'valorEncargosSociais': valorEncargosSociais,
      'despesasManutencao': despesasManutencao,
      'materialConsumo': materialConsumo,
      'aluguelRateado': aluguelRateado,
      'energiaRateada': energiaRateada,
      'depreciacaoBens': depreciacaoBens,
      'outrasDespesas': outrasDespesas,
      'totalCustoDireto': totalCustoDireto,
      'totalRateiosRecebidos': totalRateiosRecebidos,
      'totalCustoComRateios': totalCustoComRateios,
      'hrsTotaisPagas': hrsTotaisPagas,
      'minTotaisPagos': minTotaisPagos,
      'hrsAfastamento': hrsAfastamento,
      'minAfastamento': minAfastamento,
      'hrsTrabalhadas': hrsTrabalhadas,
      'minTrabalhados': minTrabalhados,
      'taxaOcupacaoCc': taxaOcupacaoCc,
      'hrsExtras': hrsExtras,
      'minExtras': minExtras,
      'custoAutomatico': custoAutomatico,
      'custoUnitarioCcAuto': custoUnitarioCcAuto,
      'hrsDisponiveis': hrsDisponiveis,
      'minDisponiveis': minDisponiveis,
    };
  }

  factory CentroCustoModel.fromMap(Map<String, dynamic> map) {
    return CentroCustoModel(
      empresaId: map['empresa_id'] ?? '',
      id: map['id'] ?? '',
      centroCusto: map['centro_custo'] ?? '',
      tipoCentroCustoId: map['tipo_centro_custo_id'] ?? '',
      custoUnitarioCc: map['custo_unitario_cc'] ?? '',
      unidadeId: map['unidade_id'] ?? '',
      dataAtualizacao: map['data_atualizacao'] ?? '',
      valorHorasNormais: map['valor_horas_normais'] ?? '',
      valorHorasExtras: map['valor_horas_extras'] ?? '',
      periculosidade: map['periculosidade'] ?? '',
      insalubridade: map['insalubridade'] ?? '',
      valorEncargosSociais: map['valor_encargos_sociais'] ?? '',
      despesasManutencao: map['despesas_manutencao'] ?? '',
      materialConsumo: map['material_consumo'] ?? '',
      aluguelRateado: map['aluguel_rateado'] ?? '',
      energiaRateada: map['energia_rateada'] ?? '',
      depreciacaoBens: map['depreciacao_bens'] ?? '',
      outrasDespesas: map['outras_despesas'] ?? '',
      totalCustoDireto: map['total_custo_direto'] ?? '',
      totalRateiosRecebidos: map['total_rateios_recebidos'] ?? '',
      totalCustoComRateios: map['total_custo_com_rateios'] ?? '',
      hrsTotaisPagas: map['hrs_totais_pagas'] ?? '',
      minTotaisPagos: map['min_totais_pagos'] ?? '',
      hrsAfastamento: map['hrs_afastamento'] ?? '',
      minAfastamento: map['min_afastamento'] ?? '',
      hrsTrabalhadas: map['hrs_trabalhadas'] ?? '',
      minTrabalhados: map['min_trabalhados'] ?? '',
      taxaOcupacaoCc: map['taxa_ocupacao_cc'] ?? '',
      hrsExtras: map['hrs_extras'] ?? '',
      minExtras: map['min_extras'] ?? '',
      custoAutomatico: map['custo_automatico'] ?? '',
      custoUnitarioCcAuto: map['custo_unitario_cc_auto'] ?? '',
      hrsDisponiveis: map['hrs_disponiveis'] ?? '',
      minDisponiveis: map['min_disponiveis'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CentroCustoModel.fromJson(String source) =>
      CentroCustoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CentroCustoModel(empresaId: $empresaId, id: $id, centroCusto: $centroCusto, tipoCentroCustoId: $tipoCentroCustoId, custoUnitarioCc: $custoUnitarioCc, unidadeId: $unidadeId, dataAtualizacao: $dataAtualizacao, valorHorasNormais: $valorHorasNormais, valorHorasExtras: $valorHorasExtras, periculosidade: $periculosidade, insalubridade: $insalubridade, valorEncargosSociais: $valorEncargosSociais, despesasManutencao: $despesasManutencao, materialConsumo: $materialConsumo, aluguelRateado: $aluguelRateado, energiaRateada: $energiaRateada, depreciacaoBens: $depreciacaoBens, outrasDespesas: $outrasDespesas, totalCustoDireto: $totalCustoDireto, totalRateiosRecebidos: $totalRateiosRecebidos, totalCustoComRateios: $totalCustoComRateios, hrsTotaisPagas: $hrsTotaisPagas, minTotaisPagos: $minTotaisPagos, hrsAfastamento: $hrsAfastamento, minAfastamento: $minAfastamento, hrsTrabalhadas: $hrsTrabalhadas, minTrabalhados: $minTrabalhados, taxaOcupacaoCc: $taxaOcupacaoCc, hrsExtras: $hrsExtras, minExtras: $minExtras, custoAutomatico: $custoAutomatico, custoUnitarioCcAuto: $custoUnitarioCcAuto, hrsDisponiveis: $hrsDisponiveis, minDisponiveis: $minDisponiveis)';
  }
}
