import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../entities/anime.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<Anime>>> call(String query);
}
