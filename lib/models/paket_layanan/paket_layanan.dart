import 'package:intl/intl.dart';
import 'package:labkesda_mobile/models/layanan/layanan.dart';

class PaketLayanan {
  final String id, name, harga;
  final String? sampleJenisDefault;
  final List<Layanan>? layanan;

  PaketLayanan({
    required this.id,
    required this.name,
    required this.harga,
    this.sampleJenisDefault = "",
    this.layanan = const [],
  });

  factory PaketLayanan.fromJson(Map<String, dynamic> json) {
    return PaketLayanan(
      id: json['id'],
      name: json['name'],
      harga: NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp.',
        decimalDigits: 0,
      ).format(
        num.parse(
          json['harga'],
        ),
      ),
      sampleJenisDefault: json['sample_jenis_default'],
      layanan: json['layanan'] != null
          ? (json['layanan'] as List).map((e) => Layanan.fromJson(e)).toList()
          : [],
    );
  }
}
