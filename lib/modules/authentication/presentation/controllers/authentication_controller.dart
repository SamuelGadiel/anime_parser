import 'dart:io';

import '../../../../core/globals/token.dart';
import '../../domain/failures/authentication_failure.dart';
import '../../domain/usecases/get_authentication.dart';

class AuthenticationController {
  final GetAuthentication usecase;

  AuthenticationController(this.usecase);

  Future<void> getApiKey() async {
    stdout.writeln('Obtendo chave de API');

    final result = await usecase();

    result.fold(
      (l) {
        stdout.writeln((l as AuthenticationFailure).message);
      },
      (r) {
        Token.apiKey = r;
      },
    );
  }
}
