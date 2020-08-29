import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:FZ_SmartHome/widgets/navigationdrawer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
        drawer: NavigationDrawer(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width / 5,
        body: ListView(children: [
          ListTile(
              title: Text("Settings",
                  style: Theme.of(context).textTheme.headline3)),
          ListTile(
              title: Text("Theme"),
              trailing: DropdownButton<String>(
                  value: _themeChanger.getThemeName(),
                  items: ["light", "dark"].map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) =>
                      setState(() => _themeChanger.setTheme(newValue)))),
          ListTile(
              title: Text("OLED"),
              trailing: Switch(
                  value: _themeChanger.getOLED(),
                  onChanged: (bool newValue) =>
                      setState(() => _themeChanger.setOLED(newValue)))),
          ListTile(title: Text("setting 3")),
          ListTile(title: Text("setting 4")),
          ListTile(title: Text("setting 5"))
        ]));
  }
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  String _themeName;
  bool _oLED = false;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  getThemeName() => _themeName;

  getOLED() => _oLED;

  setTheme(String theme) {
    _themeName = theme;
    if (_themeName == "light")
      _themeData = lightTheme;
    else if (_oLED)
      _themeData = darkThemeOLED;
    else
      _themeData = darkTheme;

    notifyListeners();
  }

  setOLED(bool oLED) {
    _oLED = oLED;
    if (_themeName == "light")
      _themeData = lightTheme;
    else if (_oLED)
      _themeData = darkThemeOLED;
    else
      _themeData = darkTheme;

    notifyListeners();
  }
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.blue,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  cardColor: Color.fromRGBO(16, 16, 16, 1.0),
  canvasColor: Colors.black,
  //accentColor: Colors.white,
  //accentIconTheme: IconThemeData(color: Colors.black),
  //dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

final testTheme = ThemeData.dark();

final ThemeData darkThemeOLED = new ThemeData(
  brightness: Brightness.dark,
  accentColor: Colors.indigoAccent[100],
  primaryColor: Color.fromRGBO(5, 5, 5, 1.0),
  backgroundColor: Colors.black,
  canvasColor: Colors.black,
  primaryColorLight: Colors.indigo[300],
  buttonColor: Colors.indigoAccent[100],
  //accentIconTheme: new IconThemeData(color: Colors.indigo[300]),
  cardColor: Color.fromRGBO(16, 16, 16, 1.0),
  dividerColor: Color.fromRGBO(20, 20, 20, 1.0),
  bottomAppBarColor: Color.fromRGBO(19, 19, 19, 1.0),
  dialogBackgroundColor: Colors.black,
  textSelectionHandleColor: Colors.indigoAccent[100],
  iconTheme: new IconThemeData(color: Colors.white),
);
