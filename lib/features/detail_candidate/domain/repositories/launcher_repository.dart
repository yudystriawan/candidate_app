import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class LauncherRepository {
  Future<Either<Failure, Unit>> launchWhatsappApp({
    required String phoneNumber,
    String? prefixMessage,
    String? message,
  });
  Future<Either<Failure, Unit>> launchEmail({
    required String email,
    String? prefixMessage,
    String? message,
  });
}
