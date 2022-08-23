import 'package:app_mcip/app/core/ui/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/app_ui_config.dart';
import '../../core/widgets/card_options.dart';
import '../../core/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sizeWidth = MediaQuery.of(context).size.width;
    final _sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppUiConfig.title),
      ),
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          SizedBox(
            width: _sizeWidth,
            height: _sizeHeight,
            child: Image.asset(
              'assets/images/wall.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 50,
            left: _sizeWidth * .1,
            right: 20,
            child: Wrap(
              spacing: 5,
              direction: Axis.horizontal,
              children: [
                CardOptions(
                  title: 'Materia Prima',
                  icon: MyIcons.beaker,
                  function: () => Modular.to.pushNamed('/materia'),
                ),
                CardOptions(
                  title: 'Componentes',
                  icon: MyIcons.tasks,
                  function: () => Modular.to.pushNamed('/componente'),
                ),
                CardOptions(
                  title: 'Centro de Custo',
                  icon: Icons.assessment,
                  function: () => Modular.to.pushNamed('/custo'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Master Business @${DateTime.now().year}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
