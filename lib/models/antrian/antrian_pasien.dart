class AntrianPasien {
  final int noAntrian;
  final DateTime waktuKunjungan;

  AntrianPasien({
    required this.noAntrian,
    required this.waktuKunjungan,
  });

  factory AntrianPasien.fromJson(Map<String, dynamic> json) {
    return AntrianPasien(
      noAntrian: json['no_antrian'],
      waktuKunjungan: DateTime.parse(json['waktu_kunjungan']),
    );
  }
}
