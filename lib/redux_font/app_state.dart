// ignore: empty_constructor_bodies
class AppState {
  late int fontSize;
  late bool isBold;
  late bool isItalic;

  AppState(
      {required this.fontSize, this.isBold = false, this.isItalic = false});

  AppState.fromAppState(AppState anotherState) {
    fontSize = anotherState.fontSize;
    isBold = anotherState.isBold;
    isItalic = anotherState.isItalic;
  }
}
