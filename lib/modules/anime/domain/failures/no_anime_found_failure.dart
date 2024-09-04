import 'anime_failures.dart';

class NoAnimeFoundFailure implements AnimeFailures {
  final String message;

  NoAnimeFoundFailure(this.message);
}
