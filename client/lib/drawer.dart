import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
          child:
              Text('Menu', style: TextStyle(fontSize: 24, color: Colors.white)),
          decoration: BoxDecoration(color: Colors.green)),
      ListTile(
          title: Text('構成図'),
          onTap: () {
            debugPrint('構成図をタップ');
          })
    ]));
  }
}
