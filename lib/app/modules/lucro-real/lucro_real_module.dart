import 'package:app_mcip/app/modules/lucro-real/detail/lucro_real_detail_page.dart';
import 'package:app_mcip/app/modules/lucro-real/lucro_real_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../../repositories/lucro-real/lucro_real_repository.dart';
import '../../repositories/lucro-real/lucro_real_repository_impl.dart';
import '../../services/lucro-real/lucro_real_service.dart';
import '../../services/lucro-real/lucro_real_service_impl.dart';
import 'controller/lucro_real_state.dart';

class LucroRealModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Servicos
        Bind.lazySingleton<LucroRealRepository>(
            (i) => LucroRealRepositoryImpl()),
        Bind.lazySingleton<LucroRealService>(
            (i) => LucroRealServiceImpl(lucroRealRepository: i())),

        BlocBind.lazySingleton(
            (i) => LucroRealController(lucroRealService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => LucroRealPage(
            lucroRealController: Modular.get<LucroRealController>(),
          ),
        ),
        ChildRoute(
          '/detail',
          child: (context, args) => LucroRealDetailPage(
            lucroRealController: Modular.get<LucroRealController>(),
            lucroRealModel: args.data,
          ),
        ),
      ];
}
