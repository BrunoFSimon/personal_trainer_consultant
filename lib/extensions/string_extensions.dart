extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    if (length == 1) return toUpperCase();

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String nameFormatter() {
    if (isEmpty) return this;
    if (length == 1) return toUpperCase();

    var words = split(' ');
    var formattedWords = words.map((word) => word.capitalize());

    return formattedWords.join(' ');
  }
}
