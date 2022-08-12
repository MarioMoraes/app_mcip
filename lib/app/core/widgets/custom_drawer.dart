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
          const UserAccountsDrawerHeader(
            accountEmail: Text("user@mail.com"),
            accountName: Text("User"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("U"),
            ),
          ),
          ListTile(
            leading: const Icon(MyIcons.beaker),
            title: const Text("Matérias Primas"),
            onTap: () {
              Modular.to.pushNamed('/materia');
            },
          ),
          ListTile(
            leading: const Icon(MyIcons.tasks),
            title: const Text("Componentes"),
            onTap: () {
              Modular.to.pushNamed('/componente');
            },
          ),
        ],
      ),
    );
  }
}
