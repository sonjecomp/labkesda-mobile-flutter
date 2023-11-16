import 'package:dio/dio.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';

class CategoryController {
  static Future<List<ValueDropdown>> getDataForDropDown(String url) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(url);
      final List<ValueDropdown> data = (response.data as List)
          .map((e) => ValueDropdown.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
