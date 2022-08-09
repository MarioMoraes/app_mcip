import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'controller/materia_prima_state.dart';
import 'materia_prima_page.dart';

class MateriaPrimaModule extends Module {
  @override
  List<Bind<Object>> get binds =>
      [BlocBind.lazySingleton((i) => MateriaPrimaController(repository: i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: ((context, args) => MateriaPrimaPage(
                  materiaPrimaController: Modular.get<MateriaPrimaController>(),
                ))),
      ];
}
