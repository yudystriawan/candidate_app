import 'dart:developer';

import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/email_repository.dart';
import '../datasources/email_remote_data_source.dart';

@Injectable(as: EmailRepository)
class EmailRepositoryImpl implements EmailRepository {
  final EmailRemoteDataSource _remoteDataSource;

  EmailRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Email>> getEmail(int id) async {
    try {
      final result = await _remoteDataSource.getEmail(id);
      final email = result.results;

      if (email == null) {
        return left(const Failure.notFound());
      }

      return right(email.toDomain());
    } on Failure catch (e) {
      return left(e);
    } catch (e, s) {
      log('getEmailFailure', error: e, stackTrace: s);
      return left(const Failure.unexpectedError());
    }
  }
}
