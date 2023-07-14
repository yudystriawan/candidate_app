import 'dart:developer';

import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/status_repository.dart';
import '../datasources/status_remote_data_source.dart';

@Injectable(as: StatusRepository)
class StatusRepositoryImpl implements StatusRepository {
  final StatusRemoteDataSource _remoteDataSource;

  StatusRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Status>> getStatus(int id) async {
    try {
      final result = await _remoteDataSource.getStatus(id);
      final status = result.results;

      if (status == null) {
        return left(const Failure.notFound());
      }

      return right(status.toDomain());
    } on Failure catch (e) {
      return left(e);
    } catch (e, s) {
      log('getStatusFailure', error: e, stackTrace: s);
      return left(const Failure.unexpectedError());
    }
  }
}
