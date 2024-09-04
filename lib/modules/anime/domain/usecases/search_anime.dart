import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../entities/anime.dart';
import '../repositories/anime_repository.dart';

abstract class SearchAnime {
  Future<Either<Failure, List<Anime>>> call(String query);
}

class SearchAnimeImplementation implements SearchAnime {
  final AnimeRepository repository;

  SearchAnimeImplementation(this.repository);

  @override
  Future<Either<Failure, List<Anime>>> call(String query) async {
    return repository(query);
  }
}
