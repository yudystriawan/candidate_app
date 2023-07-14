import 'package:candidate_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/entity.dart';
import '../repositories/address_repository.dart';

@injectable
class GetAddress implements Usecase<Address, Params> {
  final AddressRepository _repository;

  GetAddress(this._repository);

  @override
  Future<Either<Failure, Address>> call(Params params) async {
    return await _repository.getAddress(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
