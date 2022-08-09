import 'package:discount_card_app/app/modules/login/controller/login_controller.dart';
import 'package:discount_card_app/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
