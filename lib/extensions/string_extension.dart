extension StringExtension on String {
  String get randomName {
    return '$this${DateTime.now().millisecondsSinceEpoch}';
  }

  bool get isUrl {
    final Uri? uri = Uri.tryParse(this);
    if (uri == null) return false;
    if (uri.isAbsolute) {
      return true;
    } else {
      return false;
    }
  }
}
