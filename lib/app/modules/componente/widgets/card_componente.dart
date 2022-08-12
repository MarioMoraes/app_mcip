import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:app_mcip/app/models/componente_model.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/formatter.dart';

class CardComponente extends StatelessWidget {
  final ComponenteModel componenteModel;

  const CardComponente({Key? key, required this.componenteModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Descrição',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              componenteModel.componenteDesc,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Custo Unitário Total',
                  style: TextStyle(fontSize: 12),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
            componenteModel.custoUnitarioTotal != ""
                ? Text(
                    Formatter.formatCurrency(
                        double.parse(componenteModel.custoUnitarioTotal)),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 175, 34, 23),
                    ),
                  )
                : const Text(
                    'R\$ 0,00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 175, 34, 23),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
