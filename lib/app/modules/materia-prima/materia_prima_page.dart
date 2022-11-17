import 'package:app_mcip/app/core/helpers/singleton.dart';
import 'package:app_mcip/app/modules/materia-prima/widgets/card_mp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'controller/materia_prima_state.dart';

class MateriaPrimaPage extends StatefulWidget {
  final MateriaPrimaController materiaPrimaController;

  const MateriaPrimaPage({Key? key, required this.materiaPrimaController})
      : super(key: key);

  @override
  State<MateriaPrimaPage> createState() => _MateriaPrimaPageState();
}

class _MateriaPrimaPageState extends State<MateriaPrimaPage> {
  @override
  void initState() {
    super.initState();

    // Busca Materias Primas
    widget.materiaPrimaController.fetchAll(Singleton.instance.idEmpresa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matéria Prima'),
        centerTitle: true,
      ),
      body: BlocBuilder<MateriaPrimaController, MateriaPrimaState>(
        bloc: widget.materiaPrimaController,
        builder: (context, state) {
          if (state is MateriaPrimaStateLoading) {
            return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blue, size: 25));
          }

          if (state is MateriaPrimaStateLoaded) {
            return ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              itemCount: state.listMP.length,
              itemBuilder: ((context, index) {
                final item = state.listMP[index];

                return CardMp(model: item);
              }),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
