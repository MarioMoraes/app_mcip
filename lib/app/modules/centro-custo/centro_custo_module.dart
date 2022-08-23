import 'package:app_mcip/app/modules/centro-custo/centro_custo_page.dart';
import 'package:app_mcip/app/modules/centro-custo/controller/centro_custo_controller.dart';
import 'package:app_mcip/app/modules/centro-custo/detail/centro_custo_detail_page.dart';
import 'package:app_mcip/app/repositories/centro-custo/centro_custo_repository.dart';
import 'package:app_mcip/app/repositories/centro-custo/centro_custo_repository_impl.dart';
import 'package:app_mcip/app/services/centro-custo/centro_custo_service.dart';
import 'package:app_mcip/app/services/centro-custo/centro_custo_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class CentroCustoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Servicos
        Bind.lazySingleton<CentroCustoRepository>(
            (i) => CentroCustoRepositoryImpl()),
        Bind.lazySingleton<CentroCustoService>(
            (i) => CentroCustoServiceImpl(centroCustoRepository: i())),

        BlocBind.lazySingleton(
            (i) => CentroCustoController(centroCustoRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => CentroCustoPage(
            centroCustoController: Modular.get<CentroCustoController>(),
          ),
        ),
        ChildRoute(
          '/detail',
          child: (context, args) => CentroCustoDetailPage(
            centroCustoController: Modular.get<CentroCustoController>(),
            centroCusto: args.data,
          ),
        ),
      ];
}
