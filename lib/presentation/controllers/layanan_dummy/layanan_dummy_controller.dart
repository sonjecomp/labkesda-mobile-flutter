import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/layanan/layanan.dart';

class LayananDummyController {
  static Future<List<Layanan>> getData() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(AppEndpoints.getAllDummyLayanan);
      final List<Layanan> data =
          (response.data as List).map((e) => Layanan.fromJson(e)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
