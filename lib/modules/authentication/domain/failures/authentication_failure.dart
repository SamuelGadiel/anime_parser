import 'authentication_failures.dart';

class AuthenticationFailure implements AuthenticationFailures {
  final String message;

  AuthenticationFailure(this.message);
}
