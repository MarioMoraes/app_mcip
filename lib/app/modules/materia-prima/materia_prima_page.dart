import 'package:flutter/material.dart';

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
    widget.materiaPrimaController.fetchAll('1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matéria Prima'),
      ),
      body: Container(),
    );
  }
}
