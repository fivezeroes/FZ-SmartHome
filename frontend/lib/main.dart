import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/dashboardPage.dart';

void main() => runApp(FZ_SmartHome());

class FZ_SmartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
