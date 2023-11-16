import 'package:dio/dio.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';

class GeoController {
  static Future<List<ValueDropdown>> getDataForDropdown(String url) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(url);
      final List<ValueDropdown> data = (response.data as List).map((e) => ValueDropdown.fromJson(e)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
