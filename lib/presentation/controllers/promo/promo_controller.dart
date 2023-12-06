import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/promo_content/promo_models.dart';

class PromoController {
  static Future<List<PromoModels>> getPromoData() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(AppEndpoints.getAllPromo);
      final List<PromoModels> data =
          (response.data as List).map((e) => PromoModels.fromJson(e)).toList();
      return data;
    } catch (e, s) {
      print([e, s]);
      return [];
    }
  }
}
