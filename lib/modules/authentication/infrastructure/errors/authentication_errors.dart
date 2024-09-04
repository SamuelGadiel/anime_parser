abstract class AuthenticationErrors implements Exception {
  final String message;

  AuthenticationErrors(this.message);
}
