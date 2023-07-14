import 'package:candidate_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/entity.dart';
import '../repositories/email_repository.dart';

@injectable
class GetEmail implements Usecase<Email, Params> {
  final EmailRepository _repository;

  GetEmail(this._repository);

  @override
  Future<Either<Failure, Email>> call(Params params) async {
    return await _repository.getEmail(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
