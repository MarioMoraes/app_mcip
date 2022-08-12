import 'package:app_mcip/app/modules/materia-prima/detail/controller/materia_prima_detail_state.dart';
import 'package:app_mcip/app/modules/materia-prima/detail/materia_prima_detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../../repositories/materia-prima/materia_prima_repository.dart';
import '../../repositories/materia-prima/materia_prima_repository_impl.dart';
import '../../services/materia-prima/materia_prima_service.dart';
import '../../services/materia-prima/materia_prima_service_impl.dart';
import 'controller/materia_prima_state.dart';
import 'materia_prima_page.dart';

class MateriaPrimaModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Serviços
        Bind.lazySingleton<MateriaPrimaRepository>(
            (i) => MateriaPrimaRepositoryImpl()),
        Bind.lazySingleton<MateriaPrimaService>(
            (i) => MateriaPrimaServiceImpl(materiaPrimaRepository: i())),
        // Bloc
        BlocBind.lazySingleton((i) => MateriaPrimaController(repository: i())),
        BlocBind.lazySingleton(
            (i) => MateriaPrimaDetailController(materiaPrimaRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: ((context, args) => MateriaPrimaPage(
                materiaPrimaController: Modular.get<MateriaPrimaController>(),
              )),
        ),
        ChildRoute(
          '/detail',
          child: ((context, args) => MateriaPrimaDetailPage(
                materiaPrimaDetailController:
                    Modular.get<MateriaPrimaDetailController>(),
                model: args.data,
              )),
        ),
      ];
}
