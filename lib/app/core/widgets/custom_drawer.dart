import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../ui/my_icons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: const Text(
              "user@mail.com",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            accountName: const Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/profile.png'),
            ),
          ),
          ListTile(
            leading: const Icon(
              MyIcons.beaker,
              color: Colors.blue,
            ),
            title: const Text("Matérias Primas"),
            onTap: () {
              Modular.to.pushNamed('/materia');
            },
          ),
          ListTile(
            leading: const Icon(
              MyIcons.tasks,
              color: Colors.blue,
            ),
            title: const Text("Componentes"),
            onTap: () {
              Modular.to.pushNamed('/componente');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.assessment,
              color: Colors.blue,
            ),
            title: const Text("Centro de Custo"),
            onTap: () {
              Modular.to.pushNamed('/custo');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.monetization_on,
              color: Colors.blue,
            ),
            title: const Text("Lucro Real"),
            onTap: () {
              Modular.to.pushNamed('/real');
            },
          ),
        ],
      ),
    );
  }
}
