import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:app_mcip/app/models/componente_model.dart';
import 'package:app_mcip/app/modules/componente/detail/controller/componente_detail_state.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/dates.dart';
import '../../../core/helpers/formatter.dart';

class ComponenteDetailPage extends StatefulWidget {
  final ComponenteDetailController componenteDetailController;
  final ComponenteModel componenteModel;

  const ComponenteDetailPage(
      {Key? key,
      required this.componenteDetailController,
      required this.componenteModel})
      : super(key: key);

  @override
  State<ComponenteDetailPage> createState() => _ComponenteDetailPageState();
}

class _ComponenteDetailPageState extends State<ComponenteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Id',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.componenteModel.id,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Descrição',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.componenteModel.componenteDesc,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Última Atualização MP',
              style: TextStyle(fontSize: 12),
            ),
            widget.componenteModel.dataUltimaAtualizacaoMp != ""
                ? Text(
                    DatesHelper.formatDateTime(
                        widget.componenteModel.dataUltimaAtualizacaoMp),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.primaryColor),
                  )
                : const Text(''),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Última Atualização OUTROS',
              style: TextStyle(fontSize: 12),
            ),
            widget.componenteModel.dataUltimaAtualizacaoOutros != ""
                ? Text(
                    DatesHelper.formatDateTime(
                        widget.componenteModel.dataUltimaAtualizacaoOutros),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.primaryColor),
                  )
                : const Text(''),

            /*
            const Text(
              'Última Atualização PROCESSO',
              style: TextStyle(fontSize: 12),
            ),
            widget.componenteModel.dataUltimaAtualizacaoProcesso != ""
                ? Text(
                    DatesHelper.formatDateTime(
                        widget.componenteModel.componenteCustoProcesso),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.primaryColor),
                  )
                : const Text(''),
            */
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Custo Unitário Total',
              style: TextStyle(fontSize: 12),
            ),
            widget.componenteModel.custoUnitarioTotal != ""
                ? Text(
                    Formatter.formatCurrency(double.parse(
                        widget.componenteModel.custoUnitarioTotal)),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 175, 34, 23)),
                  )
                : const Text(''),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
