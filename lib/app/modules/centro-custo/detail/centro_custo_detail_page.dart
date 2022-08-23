import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:app_mcip/app/models/centro_custo_model.dart';
import 'package:app_mcip/app/modules/centro-custo/controller/centro_custo_controller.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/dates.dart';
import '../../../core/helpers/formatter.dart';

class CentroCustoDetailPage extends StatefulWidget {
  final CentroCustoController centroCustoController;
  final CentroCustoModel centroCusto;

  const CentroCustoDetailPage(
      {Key? key,
      required this.centroCustoController,
      required this.centroCusto})
      : super(key: key);

  @override
  State<CentroCustoDetailPage> createState() => _CentroCustoDetailPageState();
}

class _CentroCustoDetailPageState extends State<CentroCustoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.centroCusto.centroCusto),
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
              widget.centroCusto.id,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Tipo Centro Custo',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.centroCusto.tipoCentroCustoId,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Descrição',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.centroCusto.centroCusto,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Última Atualização',
              style: TextStyle(fontSize: 12),
            ),
            widget.centroCusto.dataAtualizacao != ""
                ? Text(
                    DatesHelper.formatDateTime(
                        widget.centroCusto.dataAtualizacao),
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
              'Custo Unitário Total',
              style: TextStyle(fontSize: 12),
            ),
            widget.centroCusto.custoUnitarioCc != ""
                ? Text(
                    Formatter.formatCurrency(
                        double.parse(widget.centroCusto.custoUnitarioCc)),
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
