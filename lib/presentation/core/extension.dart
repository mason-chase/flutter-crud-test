import 'package:flutter/cupertino.dart';

extension ContextX on BuildContext {
  void hideKeyboard() {
    if (!FocusScope.of(this).hasPrimaryFocus) {
      FocusScope.of(this).unfocus();
    }
  }
}
