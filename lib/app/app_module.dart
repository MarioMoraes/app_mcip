import 'package:app_mcip/app/repositories/auth/auth_repository.dart';
import 'package:app_mcip/app/repositories/materia-prima/materia_prima_repository.dart';
import 'package:app_mcip/app/repositories/materia-prima/materia_prima_repository_impl.dart';
import 'package:app_mcip/app/services/materia-prima/materia_prima_service.dart';
import 'package:app_mcip/app/services/materia-prima/materia_prima_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/materia-prima/materia_prima_module.dart';
import 'repositories/auth/auth_repository_impl.dart';
import 'services/auth/auth_service.dart';
import 'services/auth/auth_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Usuario
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl()),
        Bind.lazySingleton<AuthService>(
            (i) => AuthServiceImpl(authRepository: i())),

        // Materia Prima
        Bind.lazySingleton<MateriaPrimaRepository>(
            (i) => MateriaPrimaRepositoryImpl()),
        Bind.lazySingleton<MateriaPrimaService>(
            (i) => MateriaPrimaServiceImpl(materiaPrimaRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/materia', module: MateriaPrimaModule()),
      ];
}
