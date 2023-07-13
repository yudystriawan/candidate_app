import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/core/usecases/usecase.dart';
import 'package:candidate_app/features/candidates/domain/entities/candidate.dart';
import 'package:candidate_app/features/candidates/domain/repositories/candidate_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

@injectable
class GetCandidates implements Usecase<KtList<Candidate>, Params> {
  final CandidateRepository _repository;

  GetCandidates(this._repository);

  @override
  Future<Either<Failure, KtList<Candidate>>> call(params) async {
    return await _repository.getCandidates(query: params.query);
  }
}

class Params extends Equatable {
  final String? query;

  const Params(this.query);

  @override
  List<Object?> get props => [query];
}
