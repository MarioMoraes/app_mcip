import 'package:app_mcip/app/core/helpers/singleton.dart';
import 'package:app_mcip/app/models/lucro_real_detail_model.dart';
import 'package:app_mcip/app/modules/lucro-real/products/controller/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class CardProduct extends StatefulWidget {
  final LucroRealDetailModel model;
  final ProductsController controller;

  const CardProduct({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

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

    return BlocListener<ProductsController, ProductsState>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state is ProductsStateComplete) {
          widget.controller.getProducts(
            Singleton.instance.idEmpresa,
            widget.model.fpvLucroRealId,
          );
        }
      },
      child: Container(
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
              DetailValue(
                title: 'Custo/Unidade',
                value: widget.model.produtoCustoPorUnidade,
                show: false,
              ),
              DetailValue(
                title: 'Lucro Desejado',
                value: widget.model.fpvLucroRealDetailPercLucroLiquido,
                show: true,
              ),
              DetailValue(
                title: 'Margem',
                value: widget.model.margem,
                show: true,
              ),
              DetailValue(
                title: 'Pre??o Sugerido',
                value: widget.model.precoVenda,
                show: false,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  children: [
                    const Text('Pre??o Praticado'),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        await QuickAlert.show(
                          context: context,
                          type: QuickAlertType.custom,
                          confirmBtnText: 'Salvar',
                          customAsset: 'assets/images/wall.jpg',
                          widget: CustomTextFormField(
                            controller: _value,
                            label: 'Pre??o Venda',
                          ),
                        );

                        // Save Price API
                        await widget.controller.savePrice(
                          Singleton.instance.idEmpresa,
                          widget.model.fpvLucroRealId,
                          widget.model.produtoId,
                          _value.text,
                        );

                        // Refresh
                        widget.controller.getProducts(
                          Singleton.instance.idEmpresa,
                          widget.model.fpvLucroRealId,
                        );
                      },
                      child: Chip(
                        label: Text('R\$ ' +
                            double.parse(widget.model.precoPraticado)
                                .toStringAsFixed(2)),
                        backgroundColor:
                            const Color(0xff50587D).withOpacity(0.3),
                        avatar: const Icon(
                          Icons.edit_rounded,
                          size: 16,
                          color: Color.fromARGB(255, 128, 22, 15),
                        ),
                        shadowColor: Colors.grey,
                        labelStyle: TextStyle(color: Colors.blue.shade900),
                      ),
                    )
                  ],
                ),
              ),
              DetailValue(
                title: 'Lucro Praticado',
                value: widget.model.lucroLiquidoPraticado,
                show: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailValue extends StatelessWidget {
  final String title;
  final String value;
  final bool show;

  const DetailValue(
      {Key? key, required this.title, required this.value, required this.show})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle stylePrice = const TextStyle(color: Color(0xFF4B1111));
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text(
            show
                ? double.parse(value).toStringAsFixed(2) + '%'
                : 'R\$ ' + double.parse(value).toStringAsFixed(2),
            style: stylePrice,
          )
        ],
      ),
    );
  }
}
