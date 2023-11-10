class ValueDropdown {
  final String value, teks;
  ValueDropdown({
    required this.teks,
    required this.value,
  });
  factory ValueDropdown.fromJson(Map<String, dynamic> json) {
    print(json["id"]);
    print(json["name"]);
    return ValueDropdown(
      teks: json['name'],
      value: json['id'],
    );
  }
}
