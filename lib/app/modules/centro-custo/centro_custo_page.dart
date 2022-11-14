import 'package:app_mcip/app/modules/centro-custo/controller/centro_custo_controller.dart';
import 'package:app_mcip/app/modules/centro-custo/widgets/card_centro_custo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CentroCustoPage extends StatefulWidget {
  final CentroCustoController centroCustoController;

  const CentroCustoPage({Key? key, required this.centroCustoController})
      : super(key: key);

  @override
  State<CentroCustoPage> createState() => _CentroCustoPageState();
}

class _CentroCustoPageState extends State<CentroCustoPage> {
  @override
  void initState() {
    super.initState();
    widget.centroCustoController.fetchAll('99');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Centro Custo'),
      ),
      body: BlocBuilder<CentroCustoController, CentroCustoState>(
        bloc: widget.centroCustoController,
        builder: (context, state) {
          if (state is CentroCustoStateLoading) {
            return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blue, size: 25));
          }

          if (state is CentroCustoStateLoaded) {
            return ListView.builder(
              itemCount: state.listCC.length,
              itemBuilder: ((context, index) {
                var cCusto = state.listCC[index];
                return CardCentroCusto(centroCustoModel: cCusto);
              }),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
