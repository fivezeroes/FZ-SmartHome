import 'package:flutter/material.dart';

import '../widgets/navigationdrawer.dart';
import '../config/data.dart' as data;

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigagtionDrawer(),
        appBar: AppBar(title: Text('Dashboard')),
        body: Center(
            child: Text(
                'this is the dashboard. Current local temp is: ${data.localTemp}')));
  }
}
