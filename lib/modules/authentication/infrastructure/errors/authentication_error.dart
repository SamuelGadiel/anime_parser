import 'authentication_errors.dart';

class AuthenticationError implements AuthenticationErrors {
  final String message;

  AuthenticationError(this.message);
}
