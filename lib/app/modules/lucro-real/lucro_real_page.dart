import 'package:app_mcip/app/modules/lucro-real/controller/lucro_real_state.dart';
import 'package:app_mcip/app/modules/lucro-real/widgets/card_lucro_real.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LucroRealPage extends StatefulWidget {
  final LucroRealController lucroRealController;

  const LucroRealPage({Key? key, required this.lucroRealController})
      : super(key: key);

  @override
  State<LucroRealPage> createState() => _LucroRealPageState();
}

class _LucroRealPageState extends State<LucroRealPage> {
  @override
  void initState() {
    super.initState();
    widget.lucroRealController.fetchAll('99');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lucro Real'),
      ),
      body: BlocBuilder<LucroRealController, LucroRealState>(
        bloc: widget.lucroRealController,
        builder: (context, state) {
          if (state is LucroRealStateLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is LucroRealStateLoaded) {
            return ListView.builder(
              itemCount: state.listLR.length,
              itemBuilder: ((context, index) {
                var model = state.listLR[index];
                return CardLucroReal(lucroRealModel: model);
              }),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
