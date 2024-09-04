import '../../../../core/architecture/domain/failures/failure.dart';

abstract class AuthenticationFailures implements Failure {
  final String message;

  AuthenticationFailures(this.message);
}
