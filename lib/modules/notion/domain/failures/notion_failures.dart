import '../../../../core/architecture/domain/failures/failure.dart';

abstract class NotionFailures implements Failure {
  final String message;

  NotionFailures(this.message);
}
