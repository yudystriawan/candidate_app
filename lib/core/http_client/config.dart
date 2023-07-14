import 'package:dio/dio.dart';

BaseOptions getBaseOptions(String baseUrl) {
  return BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    contentType: "application/json",
    responseType: ResponseType.json,
  );
}
