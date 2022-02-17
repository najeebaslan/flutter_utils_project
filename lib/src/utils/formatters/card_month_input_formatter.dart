

/// [FuCardMonthInputFormatter] - formats the string as per the credit card expiry date format

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FuCardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text.replaceAll("/", "");

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer =  StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      if (kDebugMode) {
        print(newText[i]);
      }
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection:  TextSelection.collapsed(offset: string.length));
  }
}
