String removeTrailingZeros(String input) {
  // Remove trailing zeros after the decimal point
  input = input.replaceAll(RegExp(r'\.0*$'), '');

  // Remove trailing zeros before the decimal point
  input = input.replaceAll(RegExp(r'0*$'), '');

  // Remove the trailing decimal point, if any
  input = input.replaceAll(RegExp(r'\.$'), '');

  if (input.isEmpty) {
    return '0';
  } else {
    return input;
  }
}
