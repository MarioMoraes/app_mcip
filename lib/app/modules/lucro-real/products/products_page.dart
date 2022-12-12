import 'package:app_mcip/app/core/helpers/singleton.dart';
import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:app_mcip/app/modules/lucro-real/products/controller/products_state.dart';
import 'package:app_mcip/app/modules/lucro-real/products/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductsPage extends StatefulWidget {
  final ProductsController controller;
  final LucroRealModel model;

  const ProductsPage({Key? key, required this.controller, required this.model})
      : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    widget.controller.getProducts(
      Singleton.instance.idEmpresa,
      widget.model.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.model.observacao,
            style: const TextStyle(fontSize: 12, color: Colors.yellowAccent),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ProductsController, ProductsState>(
          bloc: widget.controller,
          builder: (context, state) {
            if (state is ProductsStateLoading) {
              return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue, size: 25));
            }

            if (state is ProductsStateLoaded) {
              return ListView.builder(
                itemCount: state.lr.length,
                itemBuilder: ((context, index) {
                  final item = state.lr[index];

                  return CardProduct(
                    model: item,
                    controller: widget.controller,
                  );
                }),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
