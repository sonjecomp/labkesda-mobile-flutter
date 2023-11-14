/// Create dummy content for dropdown
class ValueDropdown {
  final String value, teks;

  /// Easiest way to create dummy content for dropdown
  ///
  /// Require:
  /// - [value] is the value of dropdown
  /// - [teks] is the text of dropdown
  ValueDropdown({
    required this.teks,
    required this.value,
  });
  factory ValueDropdown.fromJson(Map<String, dynamic> json) {
    return ValueDropdown(
      teks: json['name'],
      value: json['id'],
    );
  }
}
