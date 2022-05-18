extension StringExtension on String {
  String sub(int l) {
    if (length < l) return this;

    return substring(0, l - 1);
  }
}
