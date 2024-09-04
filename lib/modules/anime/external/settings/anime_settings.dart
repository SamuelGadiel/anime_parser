import '../../../../core/globals/constants.dart';
import '../../../../core/globals/token.dart';

class AnimeSettings {
  static String get endpoint => '${Constants.animeUrl}/api/list/search';

  static Map<String, dynamic> get headers => {'Authorization': Token.apiKey};
}
