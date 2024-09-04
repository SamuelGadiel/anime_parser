import 'notion_errors.dart';

class NotionError implements NotionErrors {
  final String message;

  const NotionError(this.message);
}
