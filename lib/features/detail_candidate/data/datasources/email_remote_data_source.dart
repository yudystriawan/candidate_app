import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http_client/api_path.dart';
import '../../../../core/http_client/email_client.dart';
import '../models/email/response/response.dart';
import '../models/model.dart';

abstract class EmailRemoteDataSource {
  Future<EmailBaseResponse<List<EmailDto>?>> getEmails();
  Future<EmailBaseResponse<EmailDto?>> getEmail(int id);
}

@Injectable(as: EmailRemoteDataSource)
class EmailRemoteDataSourceImpl implements EmailRemoteDataSource {
  final EmailClient _client;

  EmailRemoteDataSourceImpl(this._client);

  @override
  Future<EmailBaseResponse<EmailDto?>> getEmail(int id) async {
    try {
      final result = await getEmails();
      final addresses = result.results;

      final address = addresses?.singleWhere((element) => element.id == id);

      return EmailBaseResponse(results: address);
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
      log('getEmailsFailure', error: e, stackTrace: s);
      throw const Failure.unexpectedError();
    }
  }

  @override
  Future<EmailBaseResponse<List<EmailDto>?>> getEmails() async {
    try {
      final response = await _client.get(ApiPath.getEmails);

      if (response.statusCode != 200) {
        throw const Failure.unableToFetch();
      }

      final responseData = EmailBaseResponse<List<EmailDto>?>.fromJson(
        response.data,
        (dataJson) {
          if (dataJson == null) return null;
          return (response.data['results'] as List)
              .map((json) => EmailDto.fromJson(json))
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
      log('getEmailsFailure', error: e, stackTrace: s);
      throw const Failure.unexpectedError();
    }
  }
}
