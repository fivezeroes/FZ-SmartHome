import 'package:flutter/material.dart';

import '../../config/theme.dart' as theme;

class Temps extends StatelessWidget {
  final Map<String, Map<String, int>> _temps = {
    'Master Bedroom': {'target': 72, 'actual': 72},
    'Kids Bedroom': {'target': 74, 'actual': 73},
    'Living Room': {'target': 75, 'actual': 73}
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (String room in _temps.keys)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              RichText(
                  text: TextSpan(
                      text: '$room Temp: ${_temps[room]['target']}, ',
                      style: Theme.of(context).textTheme.headline5,
                      children: [
                    TextSpan(
                        text: '${_temps[room]['actual']}',
                        style: Theme.of(context).textTheme.headline5.apply(
                            color: _temps[room]['actual'] >
                                        _temps[room]['target'] + 1 ||
                                    _temps[room]['actual'] <
                                        _temps[room]['target'] - 1
                                ? theme.warningRed
                                : theme.themedBlack))
                  ]))
            ])
        ],
      ),
    ));
  }
}
