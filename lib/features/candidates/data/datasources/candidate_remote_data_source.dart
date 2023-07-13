import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/core/http_client/api_path.dart';
import 'package:candidate_app/features/candidates/data/models/model.dart';
import 'package:candidate_app/features/candidates/data/models/response/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/http_client/candidate_client.dart';

abstract class CandidateRemoteDataSource {
  Future<CandidateBaseResponse<List<CandidateDto>?>> getCandidates(
      {String? query});
}

@Injectable(as: CandidateRemoteDataSource)
class CandidateRemoteDataSourceImpl implements CandidateRemoteDataSource {
  final CandidateClient _client;

  CandidateRemoteDataSourceImpl(this._client);

  @override
  Future<CandidateBaseResponse<List<CandidateDto>?>> getCandidates({
    String? query,
  }) async {
    try {
      final response = await _client.get(ApiPath.getCandidates);

      if (response.statusCode != 200) {
        throw const Failure.unableToFetch();
      }

      final responseData = CandidateBaseResponse<List<CandidateDto>?>.fromJson(
        response.data,
        (dataJson) {
          if (dataJson == null) return null;
          return (response.data['result'] as List)
              .map((json) => CandidateDto.fromJson(json))
              .toList();
        },
      );

      if (query != null) {
        final filteredResult = responseData.result
            ?.where((element) =>
                element.name?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList();
        return responseData.copyWith(result: filteredResult);
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
    } catch (e) {
      throw const Failure.unexpectedError();
    }
  }
}
