import 'package:app_mcip/app/modules/componente/componente_page.dart';
import 'package:app_mcip/app/modules/componente/controller/componente_state.dart';
import 'package:app_mcip/app/modules/componente/detail/componente_detail_page.dart';
import 'package:app_mcip/app/modules/componente/detail/controller/componente_detail_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../../repositories/componente/componente_repository.dart';
import '../../repositories/componente/componente_repository_impl.dart';
import '../../services/componente/componente_service.dart';
import '../../services/componente/componente_service_impl.dart';

class ComponenteModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Servicos
        Bind.lazySingleton<ComponenteRepository>(
            (i) => ComponenteRepositoryImpl()),
        Bind.lazySingleton<ComponenteService>(
            (i) => ComponenteServiceImpl(componenteRepository: i())),
        // Bloc
        BlocBind.lazySingleton(
            (i) => ComponenteController(componenteRepository: i())),
        BlocBind.lazySingleton(
            (i) => ComponenteDetailController(componenteRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => ComponentePage(
            componenteController: Modular.get<ComponenteController>(),
          ),
        ),
        ChildRoute(
          '/detail',
          child: (context, args) => ComponenteDetailPage(
            componenteDetailController:
                Modular.get<ComponenteDetailController>(),
            componenteModel: args.data,
          ),
        ),
      ];
}
