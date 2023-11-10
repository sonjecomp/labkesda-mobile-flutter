class ValueDropdown {
  final String value, teks;
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
