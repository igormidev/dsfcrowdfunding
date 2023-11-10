/// Will clip big numbers (like 2000) to 4 digits (like 2k) to reduce string size
String clipToFourDigits(int number) {
  if (number < 2000) {
    return number.toString();
  }

  if (number < 1000000) {
    return '${(number / 1000).toStringAsFixed(0)}K';
  }

  if (number < 1000000000) {
    return '${(number / 1000000).toStringAsFixed(0)}M';
  }

  return '${(number / 1000000000).toStringAsFixed(1)}B';
}
