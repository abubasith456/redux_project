import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/middleware.dart';
import '../navidation_drawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';

  Color colors(String name) {
    if (name == 'Red') {
      return Colors.red;
    } else if (name == 'Blue') {
      return Colors.blue;
    } else if (name == 'Green') {
      return Colors.blue;
    } else if (name == 'Yellow') {
      return Colors.blue;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
              ),
              drawer: NavigationDrawer(),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Hai, this is sample page for redux. Here i use some diffrent types of styles by using redux method",
                      style: TextStyle(
                          fontSize: state.fontSize.toDouble(),
                          fontWeight: state.isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontStyle: state.isItalic
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: colors(state.color)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ));
        });
  }
}
