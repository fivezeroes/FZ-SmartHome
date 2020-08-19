import 'package:flutter/material.dart';

import '../widgets/navigationdrawer.dart';
import '../config/data.dart' as data;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width / 5,
        //appBar: AppBar(title: Text('Home')),
        body: Center(
            child: Text(
                'this is the Home page. Current local temp is: ${data.localTemp}')));
  }
}
