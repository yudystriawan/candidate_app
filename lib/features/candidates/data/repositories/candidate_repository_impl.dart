import 'package:candidate_app/features/candidates/domain/entities/candidate.dart';
import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/candidates/domain/repositories/candidate_repository.dart';
import 'package:kt_dart/src/collection/kt_list.dart';
import 'package:dartz/dartz.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  @override
  Future<Either<Failure, KtList<Candidate>>> getCandidates({String? query}) {
    // TODO: implement getCandidates
    throw UnimplementedError();
  }
}
