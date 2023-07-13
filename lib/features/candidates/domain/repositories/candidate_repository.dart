import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/candidates/domain/entities/candidate.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class CandidateRepository {
  Future<Either<Failure, KtList<Candidate>>> getCandidates({
    String? query,
  });
}
