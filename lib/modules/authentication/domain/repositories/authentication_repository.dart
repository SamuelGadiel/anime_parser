import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, String>> call();
}
