import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/entity.dart';

abstract class EmailRepository {
  Future<Either<Failure, Email>> getEmail(int id);
}
