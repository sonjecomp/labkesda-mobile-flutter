import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';

class InstansiControler {
  static Future<List<ValueDropdown>> getDataForDropDown() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(AppEndpoints.getAllInstansi);
      final List<ValueDropdown> data = (response.data as List)
          .map((e) => ValueDropdown.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
