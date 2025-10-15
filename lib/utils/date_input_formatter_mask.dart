import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    String newText = '';
    for (int i = 0; i < digitsOnly.length && i < 8; i++) {
      newText += digitsOnly[i];
      if ((i == 1 || i == 3) && i != digitsOnly.length - 1) {
        newText += '/';
      }
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
