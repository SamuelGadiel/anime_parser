import '../../../../core/globals/constants.dart';
import '../../../../secrets/secrets.dart';

class NotionSettings {
  static String endpoint = '${Constants.notionApiBaseUrl}/pages';

  static Map<String, dynamic> headers = {
    'Authorization': Secrets.notionAPIKey,
  };
}
