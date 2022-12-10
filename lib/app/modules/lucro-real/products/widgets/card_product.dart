import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class CardProduct extends StatelessWidget {
  final LucroRealDetailModel model;

  const CardProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle stylePrice = const TextStyle(color: Color(0xFF4B1111));
    String value;

    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      margin: const EdgeInsets.only(top: 4),
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.blue.shade100,
            Colors.white,
          ],
          tileMode: TileMode.mirror,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.produtoId,
                    style: stylePrice.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  const Text('Custo/Unidade'),
                  const Spacer(),
                  Text(
                    model.produtoCustoPorUnidade,
                    style: stylePrice,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  const Text('Margem'),
                  const Spacer(),
                  Text(
                    model.margem,
                    style: stylePrice,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  const Text('Lucro Desejado'),
                  const Spacer(),
                  Text(
                    model.fpvLucroRealDetailPercLucroLiquido,
                    style: stylePrice,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  const Text('Lucro Praticado'),
                  const Spacer(),
                  Text(
                    model.fpvLucroRealDetailPercentualTotal,
                    style: stylePrice,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  const Text('Lucro Líquido'),
                  const Spacer(),
                  Text(
                    model.lucroLiquidoPraticado,
                    style: stylePrice,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  const Text('Preço Venda'),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      _editValue(model, context);
                    },
                    child: Chip(
                      label: Text(model.precoVenda),
                      backgroundColor: const Color(0xff50587D).withOpacity(0.5),
                      avatar: const Icon(
                        Icons.edit_note,
                        size: 18,
                      ),
                      shadowColor: Colors.grey,
                      labelStyle: TextStyle(color: Colors.blue.shade900),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _editValue(model, context) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.custom,
        barrierDismissible: true,
        confirmBtnText: 'Save',
        customAsset: 'assets/images/wall.jpg',
        widget: TextFormField(
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            hintText: 'Preço Venda',
            prefixIcon: Icon(
              Icons.money_outlined,
            ),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          onChanged: (value) => value = value,
        ),
        onConfirmBtnTap: () async {
          Navigator.canPop(context);
        });
  }
}

/*
         InkWell(
                  onTap: () {
                    print('Hello Network!');
                  },
                  child: Chip(
                    label: Text(model.precoVenda),
                    backgroundColor: const Color(0xff50587D).withOpacity(0.5),
                    avatar: const Icon(
                      Icons.edit_note,
                      size: 18,
                    ),
                    shadowColor: Colors.grey,
                    labelStyle: TextStyle(color: Colors.blue.shade900),
                  ),
                )
*/
