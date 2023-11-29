import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/controllers/dokter/dokter_controller.dart';

final dokterProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return DokterController.getDataForDropDown();
});
