import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/paket_content/paket_models.dart';
import 'package:labkesda_mobile/presentation/controllers/paket/paket_controller.dart';

final paketProvider = FutureProvider<List<PaketModels>>((ref) async {
  return PaketController.getData();
});
