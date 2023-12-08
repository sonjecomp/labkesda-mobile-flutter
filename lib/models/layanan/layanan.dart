class Layanan {
  final String id, name, harga;
  final String? jenisTindakanId;

  Layanan({
    required this.id,
    required this.name,
    required this.harga,
    this.jenisTindakanId = "",
  });

  factory Layanan.fromJson(Map<String, dynamic> json) {
    return Layanan(
      id: json['id'],
      name: json['name'],
      harga: json['harga'],
      jenisTindakanId: json['jenis_tindakan_id'] ?? "",
    );
  }
}
