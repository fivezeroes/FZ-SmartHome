import 'package:flutter/material.dart';

import '../widgets/navigationdrawer.dart';

import './thermostat/dashboardTab.dart';
import './thermostat/tempsTab.dart';

class ThermostatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: NavigagtionDrawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard),
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Dashboard')
                    ]),
              ),
              Tab(
                icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.ac_unit),
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Temps')
                    ]),
              ),
              Tab(
                icon:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.multiline_chart),
                  Padding(padding: EdgeInsets.all(5)),
                  Text('History')
                ]),
              ),
            ],
          ),
          title: Text('Thermostat'),
        ),
        body: TabBarView(
          children: [
            Dashboard(),
            Temps(),
            Icon(Icons.multiline_chart),
          ],
        ),
      ),
    );
  }
}
