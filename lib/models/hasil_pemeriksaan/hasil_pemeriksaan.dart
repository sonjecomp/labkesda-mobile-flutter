class HasilPemeriksaan {
  final String id;
  final String? kodePemeriksaan;
  final String statusPembayaranId;
  final String statusPemeriksaanId;
  final String waktuKunjungan;
  final String tipePasienId;
  final String? sampeJenis;

  HasilPemeriksaan({
    required this.id,
    this.kodePemeriksaan,
    required this.statusPembayaranId,
    required this.statusPemeriksaanId,
    required this.waktuKunjungan,
    required this.tipePasienId,
    this.sampeJenis,
  });

  factory HasilPemeriksaan.fromJson(Map<String, dynamic> json) {
    return HasilPemeriksaan(
      id: json['id'],
      kodePemeriksaan: json['kode_pemeriksaan'],
      statusPembayaranId: json['status_pembayaran_id'],
      statusPemeriksaanId: json['status_pemeriksaan_id'],
      waktuKunjungan: json['waktu_kunjungan'],
      tipePasienId: json['tipe_pasien_id'],
      sampeJenis: json['sample_jenis'],
    );
  }
}
