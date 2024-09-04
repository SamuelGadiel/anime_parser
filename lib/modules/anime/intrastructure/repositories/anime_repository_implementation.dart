import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../../domain/entities/anime.dart';
import '../../domain/failures/anime_failure.dart';
import '../../domain/failures/no_anime_found_failure.dart';
import '../../domain/repositories/anime_repository.dart';
import '../datasources/anime_datasource.dart';
import '../errors/anime_error.dart';
import '../errors/no_anime_found_error.dart';

class AnimeRepositoryImplementation implements AnimeRepository {
  final AnimeDatasource datasource;

  AnimeRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, List<Anime>>> call(String query) async {
    try {
      return Right(await datasource(query));
    } on NoAnimeFoundError catch (e) {
      return Left(NoAnimeFoundFailure(e.message));
    } on AnimeError catch (e) {
      return Left(AnimeFailure(e.message));
    } on Exception catch (e) {
      return Left(AnimeFailure(e.toString()));
    }
  }
}
