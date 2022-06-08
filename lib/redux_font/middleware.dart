import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_project/main.dart';
import 'package:redux_project/redux_font/api/api_action.dart';
import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/login_response/login_response.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:http/http.dart' as http;

ThunkAction<AppState> login() {
  return (Store<AppState> store) async {
    try {
      var jasonData;
      Map request = {"email": "admin@gmail.com", "password": "abubasith"};
      // Uri uri = "https://hidden-waters-80713.herokuapp.com/login" as Uri;
      var response = await http.post(
          Uri.parse('https://hidden-waters-80713.herokuapp.com/login'),
          body: request);

      if (response.body.isNotEmpty) {
        print(response.body);
        jasonData = json.decode(response.body);
        Users user = Users.fromJson(jasonData);
        store.dispatch(LoginAction(user));
      } else {
        print("Sorry");
      }
    } catch (e) {
      print(e.toString());
    }
  };
}
