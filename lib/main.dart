import 'dart:io';

import 'package:app_mcip/app/core/rest/my_http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  runApp(ModularApp(
    child: const AppWidget(),
    module: AppModule(),
  ));
}
