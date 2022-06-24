class Validator {
  static String validateEmail(String email) {
    RegExp regExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.isEmpty) {
      return 'Required';
    } else if (!regExp.hasMatch(email)) {
      return 'Error';
    }
    return '';
  }
}
