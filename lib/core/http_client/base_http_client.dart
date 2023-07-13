import 'package:candidate_app/core/http_client/config.dart';
import 'package:dio/dio.dart';

class BaseHttpClient {
  final String baseUrl;
  final Dio _dio;

  BaseHttpClient(
    this.baseUrl,
    this._dio,
  ) {
    _dio.options = getBaseOptions(baseUrl);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool followRedirects = true,
    bool Function(int?)? validateStatus,
    String? contentType,
  }) async {
    return _dio.post(
      path,
      data: data,
      options: Options(
        headers: headers,
        followRedirects: followRedirects,
        validateStatus: validateStatus,
        contentType: contentType,
      ),
      queryParameters: params,
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool followRedirects = true,
    bool Function(int?)? validateStatus,
    String? contentType,
  }) async {
    return _dio.put(
      path,
      data: data,
      options: Options(
        headers: headers,
        followRedirects: followRedirects,
        validateStatus: validateStatus,
        contentType: contentType,
      ),
      queryParameters: params,
    );
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool followRedirects = true,
    bool Function(int?)? validateStatus,
    String? contentType,
  }) async {
    return _dio.delete(
      path,
      data: data,
      options: Options(
        headers: headers,
        followRedirects: followRedirects,
        validateStatus: validateStatus,
        contentType: contentType,
      ),
      queryParameters: params,
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool followRedirects = true,
    bool Function(int?)? validateStatus,
    String? contentType,
  }) async {
    return await _dio.get(
      path,
      options: Options(
        headers: headers,
        validateStatus: validateStatus,
        followRedirects: followRedirects,
        contentType: contentType,
      ),
      queryParameters: params,
    );
  }
}
