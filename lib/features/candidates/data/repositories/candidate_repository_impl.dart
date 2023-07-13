import 'package:candidate_app/features/candidates/data/datasources/candidate_remote_data_source.dart';
import 'package:candidate_app/features/candidates/domain/entities/candidate.dart';
import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/candidates/domain/repositories/candidate_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/src/collection/kt_list.dart';
import 'package:dartz/dartz.dart';

@Injectable(as: CandidateRepository)
class CandidateRepositoryImpl implements CandidateRepository {
  final CandidateRemoteDataSource _remoteDataSource;

  CandidateRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, KtList<Candidate>>> getCandidates(
      {String? query}) async {
    try {
      final result = await _remoteDataSource.getCandidates(query: query);
      final candidates = result.result?.map((e) => e.toDomain()).toList();

      return right(KtList.from(candidates ?? []));
    } on Failure catch (e) {
      return left(e);
    } catch (e) {
      return left(const Failure.unexpectedError());
    }
  }
}
