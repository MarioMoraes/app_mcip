import 'package:app_mcip/app/core/helpers/singleton.dart';
import 'package:app_mcip/app/modules/componente/controller/componente_state.dart';
import 'package:app_mcip/app/modules/componente/widgets/card_componente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ComponentePage extends StatefulWidget {
  final ComponenteController componenteController;

  const ComponentePage({Key? key, required this.componenteController})
      : super(key: key);

  @override
  State<ComponentePage> createState() => _ComponentePageState();
}

class _ComponentePageState extends State<ComponentePage> {
  @override
  void initState() {
    super.initState();

    widget.componenteController.fetchAll(Singleton.instance.idEmpresa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Componentes'),
        ),
        body: BlocBuilder<ComponenteController, ComponenteState>(
          bloc: widget.componenteController,
          builder: (context, state) {
            if (state is ComponenteStateLoading) {
              return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue, size: 25));
            }

            if (state is ComponenteStateLoaded) {
              return ListView.builder(
                itemCount: state.listMP.length,
                itemBuilder: ((context, index) {
                  final item = state.listMP[index];

                  return CardComponente(componenteModel: item);
                }),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
