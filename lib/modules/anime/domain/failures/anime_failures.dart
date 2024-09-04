import '../../../../core/architecture/domain/failures/failure.dart';

abstract class AnimeFailures implements Failure {
  final String message;

  AnimeFailures(this.message);
}
