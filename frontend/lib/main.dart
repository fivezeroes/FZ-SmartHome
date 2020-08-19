import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/homePage.dart';
import './config/theme.dart' as theme;

void main() => runApp(FZ_SmartHome());

class FZ_SmartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.darkThemeOLED,
      home: HomePage(),
    );
  }
}
