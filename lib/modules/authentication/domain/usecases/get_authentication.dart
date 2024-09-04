import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../repositories/authentication_repository.dart';

abstract class GetAuthentication {
  Future<Either<Failure, String>> call();
}

class GetAuthenticationImplementation implements GetAuthentication {
  final AuthenticationRepository repository;

  GetAuthenticationImplementation(this.repository);

  @override
  Future<Either<Failure, String>> call() {
    return repository();
  }
}
