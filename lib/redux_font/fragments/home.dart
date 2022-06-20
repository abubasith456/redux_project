import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/middleware.dart';
import '../navidation_drawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';

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
                          color: state.color == 'Yellow'
                              ? Colors.yellow
                              : Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // StoreConnector<AppState, VoidCallback>(
                    //     builder: (context, callback) {
                    //   return Material(
                    //     color: Colors.blue[400],
                    //     elevation: 5,
                    //     borderRadius: BorderRadius.circular(30),
                    //     child: MaterialButton(
                    //         minWidth: MediaQuery.of(context).size.width,
                    //         onPressed: () => {
                    //               FocusManager.instance.primaryFocus?.unfocus(),
                    //               callback(),
                    //             },
                    //         child: const Text(
                    //           "Login",
                    //           style: TextStyle(color: Colors.white),
                    //         )),
                    //   );
                    // }, converter: (store) {
                    //   return () => {store.dispatch(login())};
                    // }),
                  ],
                ),
              ));
        });
  }
}
