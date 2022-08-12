import 'package:app_mcip/app/modules/componente/componente_page.dart';
import 'package:app_mcip/app/modules/componente/controller/componente_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ComponenteModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton(
            (i) => ComponenteController(componenteRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => ComponentePage(
            componenteController: Modular.get<ComponenteController>(),
          ),
        ),
      ];
}
