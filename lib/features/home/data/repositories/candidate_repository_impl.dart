import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/candidate_repository.dart';
import '../datasources/candidate_remote_data_source.dart';

@Injectable(as: CandidateRepository)
class CandidateRepositoryImpl implements CandidateRepository {
  final CandidateRemoteDataSource _remoteDataSource;

  CandidateRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, KtList<Candidate>>> getCandidates(
      {String? query}) async {
    try {
      final result = await _remoteDataSource.getCandidates(query: query);
      final candidates = result.results?.map((e) => e.toDomain()).toList();

      return right(KtList.from(candidates ?? []));
    } on Failure catch (e) {
      return left(e);
    } catch (e, s) {
      log('getCandidatesFailure', error: e, stackTrace: s);
      return left(const Failure.unexpectedError());
    }
  }
}
