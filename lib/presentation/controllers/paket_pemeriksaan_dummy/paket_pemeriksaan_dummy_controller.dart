import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/paket_layanan/paket_layanan.dart';

class PaketPemeriksaanDummyController {
  static Future<List<PaketLayanan>> getData() async {
    try {
      final Dio dio = Dio();
      final Response response =
          await dio.get(AppEndpoints.getAllDummyPaketPemeriksaan);
      final List<PaketLayanan> data =
          (response.data as List).map((e) => PaketLayanan.fromJson(e)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
