import 'anime_errors.dart';

class NoAnimeFoundError implements AnimeErrors {
  final String message;

  NoAnimeFoundError(this.message);
}
