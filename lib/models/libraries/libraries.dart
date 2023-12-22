class Libraries {
  final String? id;
  final String? name;

  Libraries({
    this.id,
    this.name,
  });

  factory Libraries.fromJson(Map<String, dynamic> json) {
    return Libraries(
      id: json['id'],
      name: json['name'],
    );
  }
}
