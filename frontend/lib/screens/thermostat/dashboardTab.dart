import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import 'package:FZ_SmartHome/config/data.dart' as data;
import 'package:FZ_SmartHome/config/theme.dart' as theme;

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Dashboard> {
  Timer _timer;

  void getTemp() {
    data.getLocalTemp();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTemp();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getTemp());
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
    return Scaffold(body: Container(child: Center(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          height: constraints.maxHeight < constraints.maxWidth
              ? constraints.maxHeight
              : constraints.maxWidth,
          child: Row(children: [
            Container(width: constraints.maxWidth / 3),
            Container(
                width: constraints.maxWidth / 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                          onPressed: () =>
                              setState(() => data.changeThermostatMode()),
                          child: theme.thermostatModeIcon[data.thermostatMode]),
                      Text('${data.localTemp}',
                          style: Theme.of(context).textTheme.headline1.apply(
                              color: data.localTemp != data.localTempTarget
                                  ? Theme.of(context).errorColor
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color))
                    ])),
            Container(
                width: constraints.maxWidth / 3,
                child: Row(children: [
                  FlutterSlider(
                      max: 82,
                      min: 62,
                      values: [data.localTempTarget.toDouble()],
                      handler: FlutterSliderHandler(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).cardColor),
                          child: Text('${data.localTempTarget}',
                              style: Theme.of(context).textTheme.headline6)),
                      handlerHeight: 40,
                      axis: Axis.vertical,
                      rtl: true,
                      tooltip: FlutterSliderTooltip(disabled: true),
                      trackBar: FlutterSliderTrackBar(
                          activeTrackBar: BoxDecoration(
                              color: Theme.of(context).accentColor)),
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        data.localTempTarget = lowerValue.round();
                        setState(() {});
                      })
                ]))
          ]));
    }))));
  }
}
