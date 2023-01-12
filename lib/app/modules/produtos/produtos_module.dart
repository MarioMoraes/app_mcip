import 'package:app_mcip/app/modules/produtos/controller/produto_state.dart';
import 'package:app_mcip/app/modules/produtos/produtos_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../../repositories/products/products_repository.dart';
import '../../repositories/products/products_repository_impl.dart';
import '../../services/products/products_service.dart';
import '../../services/products/products_service_impl.dart';

class ProdutosModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Produtos
        Bind.lazySingleton<ProductsRepository>((i) => ProductsRepositoryImpl()),
        Bind.lazySingleton<ProductsService>(
            (i) => ProductsServiceImpl(productsRepository: i())),

        BlocBind.lazySingleton((i) => ProdutoController(productsService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => ProdutosPage(
            produtoController: Modular.get<ProdutoController>(),
          ),
        ),
      ];
}
