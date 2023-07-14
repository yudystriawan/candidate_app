import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/entity.dart';

abstract class AddressRepository {
  Future<Either<Failure, Address>> getAddress(int id);
}
