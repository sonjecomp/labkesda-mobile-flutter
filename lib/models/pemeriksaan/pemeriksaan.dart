import 'package:labkesda_mobile/models/antrian/antrian_pasien.dart';
import 'package:labkesda_mobile/models/user/user.dart';

class Pemeriksaan {
  final User user;
  final AntrianPasien antrianPasien;

  Pemeriksaan({
    required this.user,
    required this.antrianPasien,
  });

  factory Pemeriksaan.fromJson(Map<String, dynamic> json) {
    return Pemeriksaan(
      user: User.fromJson(json['user']),
      antrianPasien: AntrianPasien.fromJson(json['pemeriksaan']),
    );
  }
}
