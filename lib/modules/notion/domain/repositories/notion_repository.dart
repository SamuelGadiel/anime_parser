import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../../../../entities/old_anime.dart';

abstract class NotionRepository {
  Future<Either<Failure, String>> call(OldAnime anime);
}
