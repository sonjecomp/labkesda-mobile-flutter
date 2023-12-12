class JenisLayanan {
  String id, name;

  JenisLayanan({
    required this.id,
    required this.name,
  });

  factory JenisLayanan.fromJson(Map<String, dynamic> json) {
    return JenisLayanan(
      id: json['id'],
      name: json['name'],
    );
  }
}
