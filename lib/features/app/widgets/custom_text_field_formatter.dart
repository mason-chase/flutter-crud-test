import 'package:flutter/services.dart';

class CardNumberTextFieldFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var trimmed = newValue.text.replaceAll("-", "");
    var oldValuetrimmed = oldValue.text.replaceAll("-", "");

    //zamani ke text field khali bood
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 1; i <= trimmed.length; i++) {
      buffer.write(trimmed[i - 1]);

      if (i % 4 == 0 && i != 16) {
        buffer.write('-');
        // Add double spaces.
      }
    }

    bool isRemoving = false;
    if (oldValuetrimmed.length > newValue.text.length &&
        buffer.toString().lastIndexOf('-') == buffer.toString().length - 1) {
      isRemoving = true;
    }

    return newValue.copyWith(
        text: buffer.toString(),
        selection: TextSelection.collapsed(
            offset: isRemoving ? buffer.toString().length - 1 : buffer.toString().length));
  }
}
