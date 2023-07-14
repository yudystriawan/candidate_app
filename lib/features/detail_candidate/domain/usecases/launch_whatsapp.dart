import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/core/usecases/usecase.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/launcher_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class LaunchWhatsapp implements Usecase<Unit, Params> {
  final LauncherRepository _repository;

  LaunchWhatsapp(this._repository);

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    final phoneNumber = params.phoneNumber;

    return await _repository.launchWhatsappApp(
      phoneNumber: params.phoneNumber,
      message: params.contentMessage,
      prefixMessage: params.prefixMessage,
    );
  }
}

class Params extends Equatable {
  final String phoneNumber;
  final String? prefixMessage;
  final String? contentMessage;

  const Params({
    required this.phoneNumber,
    this.prefixMessage,
    this.contentMessage,
  });
  @override
  List<Object?> get props => [phoneNumber, prefixMessage, contentMessage];
}
