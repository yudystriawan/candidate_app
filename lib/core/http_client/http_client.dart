import 'package:dio/dio.dart';

class HttpClient with DioMixin implements Dio {
  final String baseUrl;

  HttpClient(this.baseUrl);
}
