class Validator {
  // private constructor to avoid create class object
  Validator._();

  // check if string not empty and has value
  static bool hasValue(String? string) {
    if (string == null || string.isEmpty) return false;
    return true;
  }

  // Return true if email is valid. Otherwise, return false
  static String? isEmail(String? email) {
    RegExp exp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (exp.hasMatch(email ?? "")) return null;
    return "Please enter a valid email address,\n abc@xyz.com";
  }

  static String? passwordStringth(String? passwd) {
    if (!hasValue(passwd)) return "Password cannot be empty";
    if (passwd!.length < 6)
      return "we cannot allow less than 6 length of the passowrd\nplease enter a valid password";

    return null;
  }

  static String? emptyValiadtion(String? txt, String fieldName) {
    if (!hasValue(txt)) return "$fieldName cannot be empty";

    return null;
  }
}
