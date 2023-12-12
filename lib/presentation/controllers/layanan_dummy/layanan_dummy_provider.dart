import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/layanan/layanan.dart';
import 'package:labkesda_mobile/presentation/controllers/layanan_dummy/layanan_dummy_controller.dart';

final layananDummyProvider = FutureProvider<List<Layanan>>((ref) async {
  return LayananDummyController.getData();
});
