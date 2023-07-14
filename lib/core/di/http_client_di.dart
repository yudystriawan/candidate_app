import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpClientDi {
  @LazySingleton()
  Dio get dio => Dio();
}
