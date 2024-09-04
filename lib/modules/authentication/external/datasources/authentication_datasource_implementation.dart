import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import '../../../../core/globals/constants.dart';
import '../../infrastructure/datasources/authentication_datasource.dart';
import '../../infrastructure/errors/authentication_error.dart';

class AuthenticationDatasourceImplementation implements AuthenticationDatasource {
  final Dio dio;

  AuthenticationDatasourceImplementation(this.dio);

  @override
  Future<String> call() async {
    final result = await dio.get(Constants.animeUrl);
    final document = parse(result.data);
    final body = document.querySelector('body');

    if (body == null) {
      throw AuthenticationError('Got null body when tried to query select it');
    }

    final dataAttributes = body.attributes['data-data'];

    if (dataAttributes == null || dataAttributes.isEmpty) {
      throw AuthenticationError('Data attributes is null or empty in the body tag');
    }

    final Map<String, dynamic>? decodedAttributes = jsonDecode(dataAttributes);

    if (decodedAttributes == null) {
      throw AuthenticationError('Got null result when decoding data attributes');
    }

    final apiKey = decodedAttributes['apiKey'];

    if (apiKey == null) {
      throw AuthenticationError('Got Null Api Key when selecting it');
    }

    return apiKey;
  }
}
