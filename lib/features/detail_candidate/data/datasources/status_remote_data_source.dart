import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http_client/api_path.dart';
import '../../../../core/http_client/status_client.dart';
import '../models/model.dart';
import '../models/status/response/response.dart';

abstract class StatusRemoteDataSource {
  Future<StatusBaseResponse<List<StatusDto>?>> getStatuss();
  Future<StatusBaseResponse<StatusDto?>> getStatus(int id);
}

@Injectable(as: StatusRemoteDataSource)
class StatusRemoteDataSourceImpl implements StatusRemoteDataSource {
  final StatusClient _client;

  StatusRemoteDataSourceImpl(this._client);

  @override
  Future<StatusBaseResponse<StatusDto?>> getStatus(int id) async {
    try {
      final result = await getStatuss();
      final addresses = result.results;

      final address = addresses?.singleWhere((element) => element.id == id);

      return StatusBaseResponse(results: address);
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
      log('getStatussFailure', error: e, stackTrace: s);
      throw const Failure.unexpectedError();
    }
  }

  @override
  Future<StatusBaseResponse<List<StatusDto>?>> getStatuss() async {
    try {
      final response = await _client.get(ApiPath.getExperiences);

      if (response.statusCode != 200) {
        throw const Failure.unableToFetch();
      }

      final responseData = StatusBaseResponse<List<StatusDto>?>.fromJson(
        response.data,
        (dataJson) {
          if (dataJson == null) return null;
          return (response.data['results'] as List)
              .map((json) => StatusDto.fromJson(json))
              .toList();
        },
      );

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
      log('getStatussFailure', error: e, stackTrace: s);
      throw const Failure.unexpectedError();
    }
  }
}
