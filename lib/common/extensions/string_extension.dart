extension StringExtension on String {
  String sub(int length) {
    if (length < length) return this;

    return substring(0, length - 1);
  }
}
