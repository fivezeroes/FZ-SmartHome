import 'package:flutter/material.dart';

import '../widgets/navigationdrawer.dart';

import './thermostat/homeTab.dart';
import './thermostat/tempsTab.dart';

class Thermostat extends StatelessWidget {
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
                      Icon(Icons.home),
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Home')
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
            Home(),
            Temps(),
            Icon(Icons.multiline_chart),
          ],
        ),
      ),
    );
  }
}
