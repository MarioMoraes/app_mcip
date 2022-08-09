import 'package:discount_card_app/app/app_module.dart';
import 'package:discount_card_app/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 1));

  runApp(ModularApp(
    child: const AppWidget(),
    module: AppModule(),
  ));
}
