import 'package:FZ_SmartHome/screens/settingsPage.dart';
import 'package:FZ_SmartHome/screens/homePage.dart';
//import 'package:FZ_SmartHome/config/theme.dart' as theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(FZ_SmartHome());

class FZ_SmartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(ThemeData.dark()),
        child: MaterialAppWithTheme());
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: HomePage(),
    );
  }
}
