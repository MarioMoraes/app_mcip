import 'package:app_mcip/app/core/helpers/singleton.dart';
import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:app_mcip/app/modules/lucro-real/products/controller/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:quickalert/quickalert.dart';

class CardProduct extends StatefulWidget {
  final LucroRealDetailModel model;
  final ProductsController controller;

  const CardProduct({Key? key, required this.model, required this.controller})
      : super(key: key);

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  MoneyMaskedTextController _value = MoneyMaskedTextController();

  @override
  void initState() {
    _value = MoneyMaskedTextController(
      initialValue: double.parse(widget.model.precoVenda),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle stylePrice = const TextStyle(color: Color(0xFF4B1111));

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
                Text(widget.model.produtoId,
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
                    widget.model.produtoCustoPorUnidade,
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
                    widget.model.margem,
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
                    widget.model.fpvLucroRealDetailPercLucroLiquido,
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
                    widget.model.fpvLucroRealDetailPercentualTotal,
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
                    widget.model.lucroLiquidoPraticado,
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
                    onTap: () async {
                      await QuickAlert.show(
                        context: context,
                        type: QuickAlertType.custom,
                        barrierDismissible: true,
                        confirmBtnText: 'Save',
                        customAsset: 'assets/images/wall.jpg',
                        widget: TextFormField(
                          controller: _value,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            hintText: 'Preço Venda',
                            prefixIcon: Icon(
                              Icons.monetization_on,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _value = value as MoneyMaskedTextController;
                          },
                        ),
                      );

                      // Save Price API
                      await widget.controller.savePrice(
                        Singleton.instance.idEmpresa,
                        widget.model.fpvLucroRealId,
                        widget.model.produtoId,
                        _value.text,
                      );
                    },
                    child: Chip(
                      label: Text(widget.model.precoVenda),
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
}
