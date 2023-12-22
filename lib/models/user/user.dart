class User {
  final String kodePendaftaran, name, noHP, email, alamatDomisili;
  final DateTime tanggalLahir;
  final bool statusVerifEmail, statusVerifNoPhone;

  final String? nik, jenisKelaminId;

  User({
    required this.kodePendaftaran,
    required this.name,
    required this.noHP,
    required this.email,
    required this.alamatDomisili,
    required this.statusVerifEmail,
    required this.statusVerifNoPhone,
    required this.tanggalLahir,
    this.nik,
    this.jenisKelaminId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      kodePendaftaran: json['kode_pendaftaran'],
      name: json['name'],
      noHP: json['noHP'],
      email: json['email'],
      alamatDomisili: json['alamat_domisili'],
      statusVerifEmail: json['status_verif_email'],
      statusVerifNoPhone: json['status_verif_noPhone'],
      tanggalLahir: DateTime.parse(json['tanggal_lahir']),
      nik: json['nik'],
      jenisKelaminId: json['jenis_kelamin_id'],
    );
  }
}
