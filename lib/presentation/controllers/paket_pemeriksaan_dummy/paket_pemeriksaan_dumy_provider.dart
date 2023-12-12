import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/paket_layanan/paket_layanan.dart';
import 'package:labkesda_mobile/presentation/controllers/paket_pemeriksaan_dummy/paket_pemeriksaan_dummy_controller.dart';

final paketPemeriksaanDummyProvider =
    FutureProvider<List<PaketLayanan>>((ref) async {
  return PaketPemeriksaanDummyController.getData();
});
