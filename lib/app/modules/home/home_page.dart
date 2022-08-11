import 'package:app_mcip/app/core/ui/my_icons.dart';
import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/app_ui_config.dart';
import '../../core/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppUiConfig.title),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .1),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 10,
                spacing: 10,
                children: [
                  CardOptions(
                    title: 'Materia Prima',
                    icon: MyIcons.beaker,
                    function: () => Modular.to.pushNamed('/materia'),
                  ),
                  CardOptions(
                    title: 'Componentes',
                    icon: MyIcons.tasks,
                    function: () => Modular.to.pushNamed('/materia'),
                  ),
                ],
              ),
            ),
            Text(
              "Master Business @${DateTime.now().year}",
              style: const TextStyle(fontSize: 14, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

class CardOptions extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback function;

  const CardOptions(
      {Key? key,
      required this.title,
      required this.icon,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 95,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Icon(
              icon,
              size: 40,
              color: context.primaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
