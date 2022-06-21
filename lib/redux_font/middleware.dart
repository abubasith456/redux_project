import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_project/main.dart';
import 'package:redux_project/redux_font/action.dart';
import 'package:redux_project/redux_font/api/api_action.dart';
import 'package:redux_project/redux_font/app_state.dart';
import 'package:redux_project/redux_font/login_response/login_response.dart';
import 'package:redux_project/redux_font/model/usermode.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:http/http.dart' as http;

ThunkAction<AppState> getUser() {
  return (Store<AppState> store) async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      print(response.statusCode);
      final value = jsonDecode(response.body);

      List temp = value;
      List<Users> users = temp.map((e) => Users.fromJson(e)).toList();

      // Users users = Users.fromJson(value);
      // List<Users> user = (json.decode(response.body) as List)
      //     .map((data) => Users.fromJson(data))
      //     .toList();
      store.dispatch(GetJsonData(users));
    } catch (e) {
      print(e.toString());
    }
  };
}
