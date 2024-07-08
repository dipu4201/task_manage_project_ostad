class AppConstants {
  static RegExp emailRegEx = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static RegExp mobileRegEx = RegExp(
    r'@"^(?:(?:\+|00)88|01)?\d{11}$"',
  );
}