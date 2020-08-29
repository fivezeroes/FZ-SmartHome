import 'package:flutter/material.dart';

import 'package:FZ_SmartHome/widgets/navigationdrawer.dart';

import 'package:FZ_SmartHome/screens/thermostat/dashboardTab.dart';
import 'package:FZ_SmartHome/screens/thermostat/tempsTab.dart';
import 'package:FZ_SmartHome/screens/thermostat/chartsTab.dart';

class ThermostatPage extends StatefulWidget {
  @override
  _ThermostatPage createState() => _ThermostatPage();
}

class _ThermostatPage extends State<ThermostatPage> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width / 5,
        body: PageView(controller: _controller, children: [
          Dashboard(),
          Temps(),
          Charts(),
        ]));
  }
}
