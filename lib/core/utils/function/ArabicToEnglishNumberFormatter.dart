import 'package:flutter/services.dart';

class ArabicToEnglishNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Map of Arabic to English numerals
    const arabicToEnglishMap = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    // Replace Arabic numerals with English numerals
    String newText = newValue.text;
    arabicToEnglishMap.forEach((arabicNum, englishNum) {
      newText = newText.replaceAll(arabicNum, englishNum);
    });

    return newValue.copyWith(
      text: newText,
      selection: newValue.selection,
    );
  }
}
