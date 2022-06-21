import 'package:redux_project/redux_font/login_response/login_response.dart';

import 'model/usermode.dart';

class GetJsonData {
  List<Users> users;
  // Users users;
  GetJsonData(this.users);
}

class FontSize {
  int fontSize;

  FontSize(this.fontSize);
}

class Bold {
  bool isBold;
  Bold(this.isBold);
}

class Italic {
  bool isItalic;
  Italic(this.isItalic);
}

class Color {
  String color;
  Color(this.color);
}
