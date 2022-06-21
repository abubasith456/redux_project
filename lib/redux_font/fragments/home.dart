import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/middleware.dart';
import 'package:redux_project/redux_font/model/usermode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navidation_drawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';

  get http => null;

  Color colors(String name) {
    if (name == 'Red') {
      return Colors.red;
    } else if (name == 'Blue') {
      return Colors.blue;
    } else if (name == 'Green') {
      return Colors.green;
    } else if (name == 'Yellow') {
      return Colors.yellow;
    } else if (name == 'Orange') {
      return Colors.orange;
    }
    return Colors.black;
  }

  late List<Users> value;

  List<Users> user(Users users) {
    value = users as List<Users>;

    return value;
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
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: StoreConnector<AppState, VoidCallback>(
                    //     converter: (store) {
                    //       return store.dispatch(getUser());
                    //     },
                    //     builder: (context, callback) {
                    //       return TextButton(
                    //           onPressed: callback,
                    //           child: Text('Press to fetch'));
                    //     },
                    //   ),
                    // ),
                    TextButton(
                        onPressed: () {
                          // final response = await http.get(Uri.parse(
                          //     'https://jsonplaceholder.typicode.com/users'));
                          // print(response.statusCode);
                          // final value = jsonDecode(response.body);
                          // getUser();
                          StoreProvider.of<AppState>(context)
                              .dispatch(getUser());
                        },
                        child: Text('Press to fetch')),
                    Container(
                      child: Text(
                        'Hi dudes',
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 230,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.users?.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 6,
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(state.users![index].name!),
                            subtitle: Text(state.users![index].email!),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}

Function callMiddleware() {
  return getUser();
}
