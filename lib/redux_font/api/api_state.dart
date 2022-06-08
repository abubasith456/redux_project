import 'package:redux_project/redux_font/login_response/login_response.dart';

class LoginState {
  late Users? users;

  LoginState(
    this.users,
  );

  LoginState.fromLoginState(LoginState anotherloginState) {
    users = anotherloginState.users;
  }
}

class RegisterState {}
