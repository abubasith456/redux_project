import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
// import 'package:redux_project/login_reducer.dart';
import 'package:redux_project/redux_font/app_state.dart';
// import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/fragments/about_us.dart';
import 'package:redux_project/redux_font/fragments/home.dart';
import 'package:redux_project/redux_font/fragments/settings.dart';
import 'package:redux_project/redux_font/reducer.dart';
import 'package:redux_project/redux_font/routes/pageRoutes.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() => runApp(MyApp());
final store = Store(reducer,
    middleware: [thunkMiddleware],
    initialState: AppState(fontSize: 10, isBold: false, isItalic: false));

// var userData = {
//   'user_id': 0,
//   'username': "",
//   'email': "",
//   'dateOfBirth': "",
//   'mobileNumber': ""
// };
// var init = {"status": 0, 'connection': "", 'message': "", 'userData': userData};
// late Users users = Users.fromJson(init);
// final store = Store(loginReducer,
//     middleware: [thunkMiddleware], initialState: LoginState(users));

class MyApp extends StatelessWidget {
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


// void main() {
// //Store initial stage
//   final store = Store(reducer,
//       initialState: AppState(fontSize: 20, isBold: false, isItalic: false));

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // final store = Store(
//     //   loginReducer,
//     //   middleware: [thunkMiddleware],
//     //   initialState: LoginAppState.initState(),
//     // );

//     return Scaffold(
//       appBar: AppBar(title: const Text("Redux")),
//       body: const Center(
//         child: Text('My Page!'),
//       ),
//       drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: const Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );

    //    MaterialApp(
    //     title: 'Flutter Redux Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: StoreProvider(
    //       store: store,
    //       child: MyHomePage(),
    //     ),
    //   );
    // }
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Flutter Redux Demo')),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(children: [
//               TextField(
//                 cursorHeight: 25,
//                 autofocus: false,
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     hintText: "Enter your Email"),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 cursorHeight: 25,
//                 autofocus: false,
//                 controller: passwordController,
//                 decoration: const InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: "Enter your Password"),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               StoreConnector<LoginAppState, VoidCallback>(
//                   builder: (context, callback) {
//                 return Material(
//                   color: Colors.blue[400],
//                   elevation: 5,
//                   borderRadius: BorderRadius.circular(30),
//                   child: MaterialButton(
//                       minWidth: MediaQuery.of(context).size.width,
//                       onPressed: () => {
//                             FocusManager.instance.primaryFocus?.unfocus(),
//                             callback(),
//                           },
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 );
//               }, converter: (store) {
//                 return () => store.dispatch(LoginAction(
//                       emailController.text,
//                       passwordController.text,
//                     ));
//               }),
//               const SizedBox(
//                 height: 40,
//               ),
//               StoreConnector<LoginAppState, LoginAppState>(
//                   converter: (store) => store.state,
//                   builder: (context, state) => Column(
//                         children: [
//                           Text("Given email is ${state.email}"),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text("Given password is ${state.password}"),
//                         ],
//                       ))
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
