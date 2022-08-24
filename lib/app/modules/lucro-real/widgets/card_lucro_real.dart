import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/helpers/dates.dart';

class CardLucroReal extends StatelessWidget {
  final LucroRealModel lucroRealModel;

  const CardLucroReal({Key? key, required this.lucroRealModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(
        '/real/detail',
        arguments: lucroRealModel,
      ),
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
              'Tabela',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              lucroRealModel.observacao,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Simulação',
                  style: TextStyle(fontSize: 12),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
            lucroRealModel.dataSimulacao != ""
                ? Text(
                    DatesHelper.formatDateTime(lucroRealModel.dataSimulacao),
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
