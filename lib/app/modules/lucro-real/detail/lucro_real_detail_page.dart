import 'package:app_mcip/app/core/helpers/dates.dart';
import 'package:app_mcip/app/core/widgets/custom_text_form_field.dart';
import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:app_mcip/app/modules/lucro-real/controller/lucro_real_state.dart';
import 'package:flutter/material.dart';

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
  final _simulacaoEC = TextEditingController();
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

  @override
  void initState() {
    super.initState();

    _simulacaoEC.text = widget.lucroRealModel.observacao;
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
  }

  @override
  void dispose() {
    super.dispose();
    _simulacaoEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lucro Real'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: _simulacaoEC,
                label: 'Simulação',
                enabled: false,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _icms,
                      label: 'ICMS %',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _pis,
                      label: 'PIS %',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _confins,
                      label: 'CONFINS %',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _comissao,
                      label: 'COMISSÃO %',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _frete,
                label: 'FRETE %',
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _despesaAdm,
                label: 'Despesa Adm %',
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _despesaCom,
                label: 'Despesa Coml %',
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _despesaDir,
                label: 'Despesa Diretoria %',
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _despesaFin,
                label: 'Despesa Fin %',
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _lucroLiquido,
                label: 'Lucro Líquido %',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
