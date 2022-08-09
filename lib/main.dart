import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 1));

  runApp(ModularApp(
    child: const AppWidget(),
    module: AppModule(),
  ));
}
