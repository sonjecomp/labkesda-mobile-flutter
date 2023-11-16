import 'package:labkesda_mobile/models/libraries/libraries.dart';

class Categories {
  final String id;
  final String name;
  final List<Libraries> libaries;

  Categories({
    required this.id,
    required this.name,
    required this.libaries,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      libaries: json['set_libaries'],
    );
  }
}
