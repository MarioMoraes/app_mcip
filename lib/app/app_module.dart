import 'package:app_mcip/app/modules/centro-custo/centro_custo_module.dart';
import 'package:app_mcip/app/modules/componente/componente_module.dart';
import 'package:app_mcip/app/repositories/auth/auth_repository.dart';
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
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/',
            module: LoginModule(), transition: TransitionType.rightToLeft),
        ModuleRoute('/home',
            module: HomeModule(), transition: TransitionType.rightToLeft),
        ModuleRoute('/materia',
            module: MateriaPrimaModule(),
            transition: TransitionType.rightToLeft),
        ModuleRoute('/componente',
            module: ComponenteModule(), transition: TransitionType.rightToLeft),
        ModuleRoute('/custo',
            module: CentroCustoModule(),
            transition: TransitionType.rightToLeft),
      ];
}
