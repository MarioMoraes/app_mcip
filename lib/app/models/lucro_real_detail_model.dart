import 'dart:convert';

class LucroRealDetailModel {
  String empresaId;
  String fpvLucroRealId;
  String produtoId;
  String produtoCustoMp;
  String produtoCustoCp;
  String produtoCustoProcesso;
  String produtoCustoTotal;
  String produtoLoteQtde;
  String produtoCustoOutros;
  String produtoCustoPorUnidade;
  String fpvLucroRealDetailPercLucroLiquido;
  String fpvLucroRealDetailPercentualTotal;
  String markUp;
  String margem;
  String precoVenda;
  String precoPraticado;
  String lucroLiquidoPraticado;

  LucroRealDetailModel({
    required this.empresaId,
    required this.fpvLucroRealId,
    required this.produtoId,
    required this.produtoCustoMp,
    required this.produtoCustoCp,
    required this.produtoCustoProcesso,
    required this.produtoCustoTotal,
    required this.produtoLoteQtde,
    required this.produtoCustoOutros,
    required this.produtoCustoPorUnidade,
    required this.fpvLucroRealDetailPercLucroLiquido,
    required this.fpvLucroRealDetailPercentualTotal,
    required this.markUp,
    required this.margem,
    required this.precoVenda,
    required this.precoPraticado,
    required this.lucroLiquidoPraticado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'empresa_id': empresaId,
      'fpv_lucro_real_id': fpvLucroRealId,
      'produto_id': produtoId,
      'produto_custo_mp': produtoCustoMp,
      'produto_custo_cp': produtoCustoCp,
      'produto_custo_processo': produtoCustoProcesso,
      'produto_custo_total': produtoCustoTotal,
      'produto_lote_qtde': produtoLoteQtde,
      'produto_custo_outros': produtoCustoOutros,
      'produto_custo_por_unidade': produtoCustoPorUnidade,
      'fpv_lucro_real_detail_perc_lucro_liquido':
          fpvLucroRealDetailPercLucroLiquido,
      'fpv_lucro_real_detail_percentual_total':
          fpvLucroRealDetailPercentualTotal,
      'mark_up': markUp,
      'margem': margem,
      'preco_venda': precoVenda,
      'preco_praticado': precoPraticado,
      'lucro_liquido_praticado': lucroLiquidoPraticado,
    };
  }

  factory LucroRealDetailModel.fromMap(Map<String, dynamic> map) {
    return LucroRealDetailModel(
      empresaId: map['empresa_id'] as String,
      fpvLucroRealId: map['fpv_lucro_real_id'] as String,
      produtoId: map['produto_id'] as String,
      produtoCustoMp: map['produto_custo_mp'] as String,
      produtoCustoCp: map['produto_custo_cp'] as String,
      produtoCustoProcesso: map['produto_custo_processo'] as String,
      produtoCustoTotal: map['produto_custo_total'] as String,
      produtoLoteQtde: map['produto_lote_qtde'] as String,
      produtoCustoOutros: map['produto_custo_outros'] as String,
      produtoCustoPorUnidade: map['produto_custo_por_unidade'] as String,
      fpvLucroRealDetailPercLucroLiquido:
          map['fpv_lucro_real_detail_perc_lucro_liquido'] as String,
      fpvLucroRealDetailPercentualTotal:
          map['fpv_lucro_real_detail_percentual_total'] as String,
      markUp: map['mark_up'] as String,
      margem: map['margem'] as String,
      precoVenda: map['preco_venda'] as String,
      precoPraticado: map['preco_praticado'] as String,
      lucroLiquidoPraticado: map['lucro_liquido_praticado'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LucroRealDetailModel.fromJson(String source) =>
      LucroRealDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
