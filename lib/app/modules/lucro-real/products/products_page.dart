import 'package:app_mcip/app/core/helpers/singleton.dart';
import 'package:app_mcip/app/models/lucro_real_model.dart';
import 'package:app_mcip/app/modules/lucro-real/products/controller/products_state.dart';
import 'package:flutter/material.dart';

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
    widget.controller.getProducts(Singleton.instance.idEmpresa, '22', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
