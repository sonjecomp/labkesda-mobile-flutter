import 'package:dio/dio.dart';

final Dio dioPrivate = Dio(
  BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer token',
    },
  ),
);
