import 'package:discount_card_app/app/core/ui/my_icons.dart';
import 'package:flutter/material.dart';

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
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
          ListTile(
            leading: const Icon(MyIcons.tasks),
            title: const Text("Favoritos"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
        ],
      ),
    );
  }
}
