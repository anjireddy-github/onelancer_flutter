class ValidationUtils {
  static String? validateEmail(String? email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegExp.hasMatch(email!) ? null : 'Invalid Email';
  }

  static String? validatePassword(String? password) {
    final int minLength = 8;
    final RegExp uppercaseRegExp = RegExp(r'[A-Z]');
    final RegExp lowercaseRegExp = RegExp(r'[a-z]');
    final RegExp digitRegExp = RegExp(r'[0-9]');
    final RegExp specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (password!.length >= minLength &&
        uppercaseRegExp.hasMatch(password) &&
        lowercaseRegExp.hasMatch(password) &&
        digitRegExp.hasMatch(password) &&
        specialCharRegExp.hasMatch(password)) {
      return null;
    } else {
      return 'Password must be at least $minLength characters long and include one upper case letter, one lower case letter, one number, and one special character.';
    }
  }

  static String? validateText(String? text) {
    final RegExp alphabetRegExp = RegExp(r'^[a-zA-Z]+$');

    return alphabetRegExp.hasMatch(text!) ? null : 'Text should contain only alphabets';
  }

}
