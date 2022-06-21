import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/fragments/about_us.dart';
import 'package:redux_project/redux_font/fragments/home.dart';
import 'package:redux_project/redux_font/fragments/settings.dart';
import 'package:redux_project/redux_font/model/usermode.dart';
import 'package:redux_project/redux_font/reducer.dart';
import 'package:redux_project/redux_font/routes/pageRoutes.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() => runApp(const MyApp());
final store = Store(reducer,
    middleware: [thunkMiddleware],
    initialState: AppState(
        10, false, false, 'Black', [Users(id: 1, name: "", email: "")]));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Redux Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          PageRoutes.home: (context) => HomePage(),
          PageRoutes.aboutUs: (context) => AboutUs(),
          PageRoutes.settings: (context) => SettingPage(),
        },
      ),
    );
  }
}
