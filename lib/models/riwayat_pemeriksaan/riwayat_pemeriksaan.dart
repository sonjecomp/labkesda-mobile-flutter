import 'package:labkesda_mobile/models/hasil_pemeriksaan/hasil_pemeriksaan.dart';
import 'package:labkesda_mobile/models/user/user.dart';

class RiwayatPemeriksaan {
  final User user;
  final HasilPemeriksaan hasilPemeriksaan;

  RiwayatPemeriksaan({
    required this.user,
    required this.hasilPemeriksaan,
  });

  factory RiwayatPemeriksaan.fromJson(Map<String, dynamic> json) {
    return RiwayatPemeriksaan(
      user: User.fromJson(json['user']),
      hasilPemeriksaan: HasilPemeriksaan.fromJson(json['pemeriksaan']),
    );
  }
}
