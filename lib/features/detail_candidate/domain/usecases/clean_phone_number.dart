import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class CleanPhoneNumber implements Usecase<String, Params> {
  @override
  Future<Either<Failure, String>> call(Params params) async {
    String phoneNumber = params.phoneNumber;

    //remove spaces
    phoneNumber = phoneNumber.replaceAll(' ', '');

    //remove dashes
    phoneNumber = phoneNumber.replaceAll('-', '');

    return right(phoneNumber);
  }
}

class Params extends Equatable {
  final String phoneNumber;

  const Params({
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [phoneNumber];
}
