import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/entity.dart';

abstract class StatusRepository {
  Future<Either<Failure, Status>> getStatus(int id);
}
