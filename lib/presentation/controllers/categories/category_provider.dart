import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/controllers/categories/category_controller.dart';

final kewarganegaraanProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("9"));
});

final agamaProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("8"));
});

final jenisKelaminProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("3"));
});

final statusPerkawinanProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("7"));
});

final pendidikanProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("6"));
});

final pekerjaanProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("20"));
});

final golonganDarahProvider = FutureProvider<List<ValueDropdown>>((ref) async {
  return CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("5"));
});
