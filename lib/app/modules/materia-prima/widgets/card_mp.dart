import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class CardMp extends StatelessWidget {
  final String materiaPrima;
  final String custoUnitario;
  final String dataUltimaAtualizacao;

  const CardMp(
      {Key? key,
      required this.materiaPrima,
      required this.custoUnitario,
      required this.dataUltimaAtualizacao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      height: 100,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Descrição',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            materiaPrima,
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
            custoUnitario,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 175, 34, 23)),
          ),
        ],
      ),
    );
  }
}
