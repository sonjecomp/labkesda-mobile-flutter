import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/layanan/layanan.dart';
import 'package:labkesda_mobile/presentation/controllers/dio/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'layanan_controller.g.dart';

@Riverpod(keepAlive: true)
class LayananController extends _$LayananController {
  int page = 1;

  @override
  FutureOr<List<Layanan>> build() async {
    try {
      final data = await getData(page);
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<List<Layanan>> getData(int page) async {
    try {
      final Response response = await dioPrivate.get("${AppEndpoints.getAllLayanan}?page=$page");
      final List<Layanan> data = (response.data as List).map((e) => Layanan.fromJson(e)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
