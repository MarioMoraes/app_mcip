import 'package:app_mcip/app/core/helpers/dates.dart';
import 'package:app_mcip/app/core/widgets/custom_text_form_field.dart';
import 'package:app_mcip/app/core/widgets/custom_text_form_field_with_hint.dart';
import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:app_mcip/app/modules/lucro-real/controller/lucro_real_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../../core/helpers/formatter.dart';

class LucroRealDetailPage extends StatefulWidget {
  final LucroRealController lucroRealController;
  final LucroRealModel lucroRealModel;

  const LucroRealDetailPage(
      {Key? key,
      required this.lucroRealController,
      required this.lucroRealModel})
      : super(key: key);

  @override
  State<LucroRealDetailPage> createState() => _LucroRealDetailPageState();
}

class _LucroRealDetailPageState extends State<LucroRealDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _simulacao = TextEditingController();
  final _dataSimulacao = TextEditingController();
  final _icms = TextEditingController();
  final _pis = TextEditingController();
  final _confins = TextEditingController();
  final _comissao = TextEditingController();
  final _frete = TextEditingController();
  final _despesaAdm = TextEditingController();
  final _despesaCom = TextEditingController();
  final _despesaDir = TextEditingController();
  final _despesaFin = TextEditingController();
  final _lucroLiquido = TextEditingController();
  final _percTotal = TextEditingController();
  final _markup = TextEditingController();

  MoneyMaskedTextController controller = MoneyMaskedTextController();

  @override
  void initState() {
    super.initState();

    _setData();
  }

  @override
  void dispose() {
    super.dispose();

    _simulacao.dispose();
    _dataSimulacao.dispose();
    _comissao.dispose();
    _confins.dispose();
    _despesaAdm.dispose();
    _despesaCom.dispose();
    _despesaFin.dispose();
    _frete.dispose();
    _icms.dispose();
    _lucroLiquido.dispose();
    _percTotal.dispose();
    _pis.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lucro Real'),
      ),
      bottomNavigationBar: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('Salvar')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: _simulacao,
                hint: 'Simulação',
                enabled: false,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      hint: 'ICMS %',
                      controller: _icms,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _pis,
                      hint: 'PIS %',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _confins,
                      hint: 'CONFINS %',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _comissao,
                      hint: 'Comissão %',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _frete,
                      hint: 'Frete %',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _despesaAdm,
                      hint: 'Despesa Adm %',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _despesaCom,
                      hint: 'Despesa Coml %',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _despesaDir,
                      hint: 'Despesa Diretoria %',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _despesaFin,
                      hint: 'Despesa Fin %',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormFieldWithHint(
                      controller: _lucroLiquido,
                      hint: 'Lucro Líquido %',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setData() {
    _simulacao.text = widget.lucroRealModel.observacao;
    _dataSimulacao.text =
        DatesHelper.formatDateTime(widget.lucroRealModel.dataSimulacao);
    _icms.text =
        Formatter.formatPercent(double.parse(widget.lucroRealModel.percIcms));
    _pis.text =
        Formatter.formatPercent(double.parse(widget.lucroRealModel.percPis));
    _confins.text =
        Formatter.formatPercent(double.parse(widget.lucroRealModel.percCofins));
    _comissao.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percComissao));
    _frete.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percComissao));
    _despesaAdm.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percDespAdministrativa));
    _despesaCom.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percDespComercial));
    _despesaDir.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percDespDiretoria));
    _despesaFin.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percDespFinanceira));
    _lucroLiquido.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percLucroLiquido));
    _percTotal.text = Formatter.formatPercent(
        double.parse(widget.lucroRealModel.percentualTotal));

    double totalImpostos = 0.00;
    double markup = 0.00;

    totalImpostos = double.tryParse(widget.lucroRealModel.percIcms)! +
        double.tryParse(widget.lucroRealModel.percPis)! +
        double.tryParse(widget.lucroRealModel.percCofins)! +
        double.tryParse(widget.lucroRealModel.percComissao)! +
        double.tryParse(widget.lucroRealModel.percFrete)! +
        double.tryParse(widget.lucroRealModel.percDespAdministrativa)! +
        double.tryParse(widget.lucroRealModel.percDespComercial)! +
        double.tryParse(widget.lucroRealModel.percDespFinanceira)! +
        double.tryParse(widget.lucroRealModel.percDespDiretoria)! +
        double.tryParse(widget.lucroRealModel.percLucroLiquido)!;

    var calculo = 100 - totalImpostos;
    var calculo2 = calculo / 100;
    var calculo3 = 1 / calculo2;

    print(calculo);
    print(calculo2);
    print(calculo3);
  }
}
