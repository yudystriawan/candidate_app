import 'dart:developer';

import 'package:candidate_app/features/detail_candidate/data/models/address/response/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http_client/address_client.dart';
import '../../../../core/http_client/api_path.dart';
import '../models/model.dart';

abstract class AddressRemoteDataSource {
  Future<AddressBaseResponse<List<AddressDto>?>> getAddresses();
  Future<AddressBaseResponse<AddressDto?>> getAddress(int id);
}

@Injectable(as: AddressRemoteDataSource)
class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final AddressClient _client;

  AddressRemoteDataSourceImpl(this._client);

  @override
  Future<AddressBaseResponse<AddressDto?>> getAddress(int id) async {
    try {
      final result = await getAddresses();
      final addresses = result.results;

      final address = addresses?.singleWhere((element) => element.id == id);

      return AddressBaseResponse(results: address);
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
      log('getAddresssFailure', error: e, stackTrace: s);
      throw const Failure.unexpectedError();
    }
  }

  @override
  Future<AddressBaseResponse<List<AddressDto>?>> getAddresses() async {
    try {
      final response = await _client.get(ApiPath.getAddresses);

      if (response.statusCode != 200) {
        throw const Failure.unableToFetch();
      }

      final responseData = AddressBaseResponse<List<AddressDto>?>.fromJson(
        response.data,
        (dataJson) {
          if (dataJson == null) return null;
          return (response.data['results'] as List)
              .map((json) => AddressDto.fromJson(json))
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
      log('getAddresssFailure', error: e, stackTrace: s);
      throw const Failure.unexpectedError();
    }
  }
}
