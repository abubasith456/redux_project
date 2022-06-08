import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_project/redux_font/api/api_state.dart';
import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/middleware.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<LoginState, LoginState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  TextField(
                    cursorHeight: 25,
                    autofocus: false,
                    controller: emailController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: "Enter your Email"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorHeight: 25,
                    autofocus: false,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: "Enter your Password"),
                  ),
                  StoreConnector<AppState, VoidCallback>(
                      builder: (context, callback) {
                    return Material(
                      color: Colors.blue[400],
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () => {
                                FocusManager.instance.primaryFocus?.unfocus(),
                                callback(),
                              },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    );
                  }, converter: (store) {
                    return () => {store.dispatch(login())};
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
