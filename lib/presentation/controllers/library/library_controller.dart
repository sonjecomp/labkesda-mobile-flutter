import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/libraries/libraries.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'library_controller.g.dart';

@riverpod
FutureOr<Libraries?> libraryController(
  LibraryControllerRef ref, {
  required int libraryId,
}) async {
  final Dio dio = Dio();

  try {
    final Response response = await dio.get(
      "${AppEndpoints.getLibrary}/$libraryId",
    );

    Libraries libraries = Libraries.fromJson(response.data);

    return libraries;
  } catch (e) {
    return null;
  }
}
