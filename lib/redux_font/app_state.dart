// ignore: empty_constructor_bodies
import 'package:redux_project/redux_font/login_response/login_response.dart';

import 'model/usermode.dart';

class AppState {
  late int fontSize;
  late bool isBold;
  late bool isItalic;
  late String color;
  late List<Users>? users;
  // late Users users;

  AppState(this.fontSize, this.isBold, this.isItalic, this.color, this.users);

  AppState.fromAppState(AppState anotherState) {
    fontSize = anotherState.fontSize;
    isBold = anotherState.isBold;
    isItalic = anotherState.isItalic;
    color = anotherState.color;
    users = anotherState.users;
  }

  AppState.init() {}
}

// class DropDownState {
//   late String color;

//   DropDownState({required this.color});

//   DropDownState.fromAppState(DropDownState anotherSate) {
//     color = anotherSate.color;
//   }
// }
