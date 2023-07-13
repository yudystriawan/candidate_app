import 'package:candidate_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/entity.dart';
import '../repositories/status_repository.dart';

@injectable
class GetStatus implements Usecase<Status, Params> {
  final StatusRepository _repository;

  GetStatus(this._repository);

  @override
  Future<Either<Failure, Status>> call(Params params) async {
    return await _repository.getStatus(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
