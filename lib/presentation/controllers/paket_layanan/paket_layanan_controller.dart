import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/paket_layanan/paket_layanan.dart';
import 'package:labkesda_mobile/presentation/controllers/dio/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paket_layanan_controller.g.dart';

@Riverpod(keepAlive: true)
class PaketLayananController extends _$PaketLayananController {
  int page = 1;

  @override
  FutureOr<List<PaketLayanan>> build() async {
    try {
      final data = await getData(page);
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<List<PaketLayanan>> getData(int page) async {
    try {
      final Response response = await dioPrivate.get("${AppEndpoints.getAllPaketLayanan}?page=$page");
      final List<PaketLayanan> data = (response.data as List).map((e) => PaketLayanan.fromJson(e)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
