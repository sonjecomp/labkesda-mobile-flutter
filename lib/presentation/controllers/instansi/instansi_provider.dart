import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/controllers/instansi/instansi_controller.dart';

final instansiProvider = FutureProvider<List<ValueDropdown>>(
  (ref) async => InstansiControler.getDataForDropDown(),
);
