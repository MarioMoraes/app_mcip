import 'package:flutter_modular/flutter_modular.dart';

import 'controller/login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => LoginController(authService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => LoginPage(
                  loginController: Modular.get<LoginController>(),
                )),
      ];
}
