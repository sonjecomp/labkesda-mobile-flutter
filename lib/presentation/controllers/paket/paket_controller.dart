import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/paket_content/paket_models.dart';

class PaketController {
  static Future<List<PaketModels>> getData() async {
    try {
      final Dio dio = Dio();
      final Response response =
          await dio.get(AppEndpoints.getAllPaketPemeriksaan);
      final List<PaketModels> data =
          (response.data as List).map((e) => PaketModels.fromJson(e)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
