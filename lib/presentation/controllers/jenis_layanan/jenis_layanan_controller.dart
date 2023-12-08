import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/jenis_layanan/jenis_layanan.dart';
import 'package:labkesda_mobile/presentation/controllers/dio/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'jenis_layanan_controller.g.dart';

@Riverpod(keepAlive: true)
class JenisLayananController extends _$JenisLayananController {
  @override
  FutureOr<List<JenisLayanan>> build() async {
    try {
      final data = await getData();
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<List<JenisLayanan>> getData() async {
    try {
      final Response response = await dioPrivate.get(AppEndpoints.getAllJenisLayanan);
      final List<JenisLayanan> data = (response.data as List)
          .map(
            (e) => JenisLayanan.fromJson(e),
          )
          .toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
