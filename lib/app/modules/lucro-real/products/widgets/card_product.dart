import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final LucroRealDetailModel model;

  const CardProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            model.produtoId,
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
                'Custo Total',
                style: TextStyle(fontSize: 12),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
          /*
          model.custoUnitarioTotal != ""
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
          */
        ],
      ),
    );
  }
}
