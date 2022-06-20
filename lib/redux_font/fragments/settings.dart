import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_project/redux_font/action.dart';
import 'package:redux_project/redux_font/app_state.dart';
import '../navidation_drawer.dart';
import '../reducer.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/eventPage';

  var store = Store<DropDownState>(dropDownReducer,
      initialState: DropDownState(color: 'Black'));

  var selectedValue = 'Black';
  var items = [
    'Blue',
    'Green',
    'Red',
    'Yellow',
    'Orange',
    'Black',
  ];

  @override
  Widget build(BuildContext context) {
    int _value = 10;
    double _currentSliderValue = 20;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            drawer: NavigationDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Font Size',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                    const Text(
                      'Font Style:',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                          const Text(
                            "Bold",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
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
                          const Text(
                            "Italic",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Text color:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    StoreProvider<DropDownState>(
                      store: store,
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              items: items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          80,
                                      child: Text(value)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                StoreProvider.of<AppState>(context)
                                    .dispatch(Color(value!));
                              },
                              value: state.color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
