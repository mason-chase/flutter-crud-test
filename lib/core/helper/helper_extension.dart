extension FormValidation on String? {
  bool get isValidEmail {
    if (this == null) return false;
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegExp.hasMatch(this!);
  }

  bool get isNotNull => this != null && this!.trim().isNotEmpty;

  bool get isValidPhone {
    if (this == null) return false;
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this!);
  }

  bool get isValidDate {
    if (this == null) return false;
    final dateRegExp =
        RegExp(r"^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$");
    return dateRegExp.hasMatch(this!);
  }

  bool get isValidBank {
    if (this == null) return false;
    final dateRegExp = RegExp(r"^([0-9]{11})|([0-9]{2}-[0-9]{3}-[0-9]{6})$");
    return dateRegExp.hasMatch(this!.replaceAll('-', ''));
  }
}
