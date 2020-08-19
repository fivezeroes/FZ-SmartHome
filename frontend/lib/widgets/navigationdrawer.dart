import 'package:flutter/material.dart';

import './createroute.dart';
import '../screens/homePage.dart';
import '../screens/thermostatPage.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Text('FZ-SmartHome', textScaleFactor: 2),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor)),
          ListTile(
              title: Row(children: [
                Icon(Icons.home),
                Padding(padding: EdgeInsets.all(5)),
                Text('Home')
              ]),
              onTap: () =>
                  Navigator.pushReplacement(context, createRoute(HomePage()))),
          ListTile(
              title: Row(children: [
                Icon(Icons.thermostat_outlined),
                Padding(padding: EdgeInsets.all(5)),
                Text('Thermostat')
              ]),
              onTap: () => Navigator.pushReplacement(
                  context, createRoute(ThermostatPage())))
        ],
      ),
    );
  }
}
