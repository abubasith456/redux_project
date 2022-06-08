import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_project/redux_font/action.dart';
import 'package:redux_project/redux_font/app_state.dart';
import '../navidation_drawer.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/eventPage';

  @override
  Widget build(BuildContext context) {
    int _value = 10;
    double _currentSliderValue = 20;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Events"),
            ),
            drawer: NavigationDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                const Text(
                  'Font Size',
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 5,
                ),
                Slider(
                  value: state.fontSize.toDouble(),
                  min: 10,
                  max: 30,
                  label: _currentSliderValue.toString(),
                  onChanged: (double value) {
                    _currentSliderValue = value;
                    StoreProvider.of<AppState>(context)
                        .dispatch(FontSize(value.toInt()));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        value: state.isBold,
                        onChanged: (newValue) {
                          StoreProvider.of<AppState>(context)
                              .dispatch(Bold(newValue!));
                        },
                      ),
                      const Text("Bold")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        value: state.isItalic,
                        onChanged: (newValue) {
                          StoreProvider.of<AppState>(context)
                              .dispatch(Italic(newValue!));
                        },
                      ),
                      const Text("Italic")
                    ],
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
