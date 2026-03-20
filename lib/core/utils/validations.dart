class Validations {
  static bool isValidEmail(String email) {
    // final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    // return emailRegex.hasMatch(email);
    return email
        .isNotEmpty; // Placeholder implementation - replace with actual email validation
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
