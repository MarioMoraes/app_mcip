import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:app_mcip/app/models/produto_model.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/formatter.dart';

class CardProduto extends StatelessWidget {
  final ProdutoModel model;

  const CardProduto({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // await Modular.to.pushNamed('/materia/detail', arguments: model);
        // Modular.to.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        height: 110,
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
              model.produto,
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
                  'Custo Unitário (R\$)',
                  style: TextStyle(fontSize: 12),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
            Text(
              Formatter.formatCurrency(double.parse(model.custoPorUnidade)),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 175, 34, 23)),
            ),
          ],
        ),
      ),
    );
  }
}
