import 'package:dio/dio.dart';
import 'package:labkesda_mobile/models/promo_content/promo_models.dart';

class PromoController {
  static Future<List<PromoModels>> getPromoData() async {
    try {
      const String urlPath =
          'https://dummy-for-promo-labkesda-default-rtdb.asia-southeast1.firebasedatabase.app/promo.json';
      final Dio dio = Dio();
      final Response response = await dio.get(urlPath);
      final List<PromoModels> data =
          (response.data as List).map((e) => PromoModels.fromJson(e)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
