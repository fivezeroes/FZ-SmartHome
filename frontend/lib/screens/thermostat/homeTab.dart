import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import '../../config/data.dart' as data;
import '../../config/theme.dart' as theme;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int _targetTemp = 72;

  Timer _timer;

  void getTemp() {
    data.getLocalTemp();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTemp();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getTemp());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (data.localTemp < 0) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Target Temp: $_targetTemp',
            style: Theme.of(context).textTheme.headline4),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        RichText(
            text: TextSpan(
                text: 'Actual Temp:',
                style: Theme.of(context).textTheme.headline4,
                children: [
              TextSpan(
                  text: '${data.localTemp}',
                  style: Theme.of(context).textTheme.headline4.apply(
                      color: data.localTemp != _targetTemp
                          ? theme.warningRed
                          : theme.themedBlack))
            ]))
      ]),
      FlutterSlider(
        max: 85,
        min: 60,
        values: [_targetTemp.toDouble()],
        onDragging: (handlerIndex, lowerValue, upperValue) {
          _targetTemp = lowerValue.round();
          setState(() {});
        },
      )
    ])));
  }
}
