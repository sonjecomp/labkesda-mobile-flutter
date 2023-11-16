import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/controllers/geo/geo_controller.dart';

final provinsiProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return GeoController.getDataForDropdown(AppEndpoints.getAllProvinsi);
});
