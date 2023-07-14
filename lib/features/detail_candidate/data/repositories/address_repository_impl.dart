import 'dart:developer';

import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/data/datasources/address_remote_data_source.dart';
import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/address_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepository)
class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource _remoteDataSource;

  AddressRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Address>> getAddress(int id) async {
    try {
      final result = await _remoteDataSource.getAddress(id);
      final address = result.results;

      if (address == null) {
        return left(const Failure.notFound());
      }

      return right(address.toDomain());
    } on Failure catch (e) {
      return left(e);
    } catch (e, s) {
      log('getAddressFailure', error: e, stackTrace: s);
      return left(const Failure.unexpectedError());
    }
  }
}
