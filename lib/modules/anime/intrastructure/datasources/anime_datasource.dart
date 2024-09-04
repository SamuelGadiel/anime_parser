import '../../domain/entities/anime.dart';

abstract class AnimeDatasource {
  Future<List<Anime>> call(String query);
}
