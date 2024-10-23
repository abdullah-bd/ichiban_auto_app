/// Extension methods for nullable and non-nullable types.
extension NonNullString on String? {
  /// Returns an empty string if the original string is null.
  ///
  /// \return An empty string if the original string is null, otherwise the original string.
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  /// Returns zero if the original integer is null.
  ///
  /// \return Zero if the original integer is null, otherwise the original integer.
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension EmailValidator on String {
  /// Validates if the string is a valid email format.
  ///
  /// \return True if the string is a valid email format, otherwise false.
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension FirebaseEmail on String {
  /// Converts the string to a Firebase-compatible email format.
  ///
  /// \return The string with dots replaced by "dot".
  String get firebaseEmail {
    return replaceAll(".", "dot");
  }
}