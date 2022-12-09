import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final LucroRealDetailModel model;

  const CardProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle stylePrice = const TextStyle(color: Color(0xFF4B1111));

    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      margin: const EdgeInsets.only(top: 4),
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Table(
        //defaultColumnWidth: const FixedColumnWidth(50.0),
        children: [
          TableRow(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 25,
                decoration: const BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      model.produtoId,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const TableRow(
            children: [
              SizedBox(
                width: 5,
              ),
              Text('Custo/Unidade'),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


/*
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              const Text('Custo/Unidade'),
              const SizedBox(
                width: 5,
              ),
              Text(
                '9,999.99',
                style: stylePrice,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('Lucro Desejado'),
              const SizedBox(
                width: 10,
              ),
              Text(
                '9,999.99',
                style: stylePrice,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            child: Row(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Margem'),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Lucro Praticado'),
                ),
              ],
            ),
          )
*/