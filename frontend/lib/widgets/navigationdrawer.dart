import 'package:flutter/material.dart';

import './createroute.dart';
import '../screens/dashboardPage.dart';
import '../screens/thermostatPage.dart';

class NavigagtionDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Text('FZ-SmartHome',
                  textScaleFactor: 2, style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(color: Colors.blue)),
          ListTile(
              title: Row(children: [
                Icon(Icons.dashboard),
                Padding(padding: EdgeInsets.all(5)),
                Text('Dashboard')
              ]),
              onTap: () => Navigator.pushReplacement(
                  context, createRoute(DashboardPage()))),
          ListTile(
              title: Row(children: [
                Icon(Icons.thermostat_outlined),
                Padding(padding: EdgeInsets.all(5)),
                Text('Thermostat')
              ]),
              onTap: () =>
                  Navigator.pushReplacement(context, createRoute(Thermostat())))
        ],
      ),
    );
  }
}
