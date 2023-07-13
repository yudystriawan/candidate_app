import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http_client/api_path.dart';
import '../../../../core/http_client/blog_client.dart';
import '../models/blog/response/response.dart';
import '../models/model.dart';

abstract class BlogRemoteDataSource {
  Future<BlogBaseResponse<List<BlogDto>?>> getBlogs({String? query});
}

@Injectable(as: BlogRemoteDataSource)
class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final BlogClient _client;

  BlogRemoteDataSourceImpl(this._client);

  @override
  Future<BlogBaseResponse<List<BlogDto>?>> getBlogs({String? query}) async {
    try {
      final response = await _client.get(ApiPath.getBlogs);

      if (response.statusCode != 200) {
        throw const Failure.unableToFetch();
      }

      final responseData = BlogBaseResponse<List<BlogDto>?>.fromJson(
        response.data,
        (dataJson) {
          if (dataJson == null) return null;
          return (response.data['results'] as List)
              .map((json) => BlogDto.fromJson(json))
              .toList();
        },
      );

      if (query != null) {
        final filteredResult = responseData.results
            ?.where((element) =>
                element.title?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList();
        return responseData.copyWith(results: filteredResult);
      }

      return responseData;
    } on DioException catch (e) {
      if ((e.response?.statusCode ?? 0) >= 500) {
        throw Failure.serverError(
          statusCode: e.response?.statusCode,
          message: e.response?.statusMessage,
          requestOptions: e.requestOptions,
        );
      }

      throw Failure.serverError(
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
      );
    } catch (e, s) {
      log('getBlogsFailure', error: e, stackTrace: s);
      throw const Failure.unexpectedError();
    }
  }
}
