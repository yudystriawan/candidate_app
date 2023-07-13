import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/core/usecases/usecase.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/launcher_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class LaunchEmail implements Usecase<Unit, Params> {
  final LauncherRepository _repository;

  LaunchEmail(this._repository);

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return await _repository.launchEmail(
      email: params.email,
      message: params.contentMessage,
      prefixMessage: params.prefixMessage,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String? prefixMessage;
  final String? contentMessage;

  const Params({
    required this.email,
    this.prefixMessage,
    this.contentMessage,
  });
  @override
  List<Object?> get props => [email, prefixMessage, contentMessage];
}
