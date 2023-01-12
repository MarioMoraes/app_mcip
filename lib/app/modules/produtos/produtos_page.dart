import 'package:app_mcip/app/core/helpers/singleton.dart';
import 'package:app_mcip/app/modules/produtos/controller/produto_state.dart';
import 'package:app_mcip/app/modules/produtos/widgets/card_produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProdutosPage extends StatefulWidget {
  final ProdutoController produtoController;

  const ProdutosPage({Key? key, required this.produtoController})
      : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  @override
  void initState() {
    super.initState();
    widget.produtoController.getProdutos(Singleton.instance.idEmpresa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produtos'),
        ),
        body: BlocBuilder<ProdutoController, ProdutoState>(
          bloc: widget.produtoController,
          builder: (context, state) {
            if (state is ProdutoStateLoading) {
              return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue, size: 25));
            }

            if (state is ProdutoStateLoaded) {
              return ListView.builder(
                itemCount: state.listLR.length,
                itemBuilder: ((context, index) {
                  final item = state.listLR[index];

                  return CardProduto(
                    model: item,
                  );
                }),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
