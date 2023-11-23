import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';

class DokterController {
  static Future<List<ValueDropdown>> getDataForDropDown() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(AppEndpoints.getAllDokter);
      final List<ValueDropdown> data = (response.data as List)
          .map((e) => ValueDropdown.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
