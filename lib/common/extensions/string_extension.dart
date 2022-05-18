extension StringExtension on String {
  String get sub30 {
    if (length < 30) return this;

    return substring(0, 29);
  }
}
