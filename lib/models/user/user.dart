class User {
  final String kodePendaftaran, name;
  final bool statusVerifEmail, statusVerifNoPhone;

  final String? nik, jenisKelaminId, email, tanggalLahir, noHP, alamatDomisili;

  User({
    required this.kodePendaftaran,
    required this.name,
    this.noHP,
    this.alamatDomisili,
    required this.statusVerifEmail,
    required this.statusVerifNoPhone,
    this.tanggalLahir,
    this.email,
    this.nik,
    this.jenisKelaminId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      kodePendaftaran: json['kode_pendaftaran'],
      name: json['name'],
      noHP: json['noHP'] ?? '',
      email: json['email'] ?? '',
      alamatDomisili: json['alamat_domisili'] ?? '',
      statusVerifEmail: json['status_verif_email'],
      statusVerifNoPhone: json['status_verif_noPhone'],
      tanggalLahir: json['tanggal_lahir'] ?? '',
      nik: json['nik'],
      jenisKelaminId: json['jenis_kelamin_id'],
    );
  }
}
