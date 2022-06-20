// ignore: empty_constructor_bodies
class AppState {
  late int fontSize;
  late bool isBold;
  late bool isItalic;
  late String color;

  AppState(
      {required this.fontSize,
      this.isBold = false,
      this.isItalic = false,
      this.color = 'Black'});

  AppState.fromAppState(AppState anotherState) {
    fontSize = anotherState.fontSize;
    isBold = anotherState.isBold;
    isItalic = anotherState.isItalic;
    color = anotherState.color;
  }
}

class DropDownState {
  late String color;

  DropDownState({required this.color});

  DropDownState.fromAppState(DropDownState anotherSate) {
    color = anotherSate.color;
  }
}
