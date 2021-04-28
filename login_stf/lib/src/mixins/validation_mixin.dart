class Validation {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'You should use this -@- symbol';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length <= 3) {
      return 'You should use at least 4 characters';
    }
    return null;
  }
}
