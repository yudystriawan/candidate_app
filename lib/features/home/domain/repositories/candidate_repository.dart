import 'package:candidate_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import '../entities/entity.dart';

abstract class CandidateRepository {
  Future<Either<Failure, KtList<Candidate>>> getCandidates({
    String? query,
  });
}
