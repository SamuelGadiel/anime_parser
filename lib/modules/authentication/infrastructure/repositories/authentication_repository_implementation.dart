import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../../domain/failures/authentication_failure.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_datasource.dart';
import '../errors/authentication_error.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, String>> call() async {
    try {
      return Right(await datasource());
    } on AuthenticationError catch (e) {
      return Left(AuthenticationFailure(e.message));
    } on Exception catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
