import 'package:intl/intl.dart';

import '../../domain/entities/anime.dart';

class AnimeMapper {
  static Anime fromJson(Map<String, dynamic> json) {
    final aniListScore = double.tryParse(json['ani_list_score'] ?? '') ?? 0;
    final malScore = double.tryParse(json['my_anime_list_score'] ?? '') ?? 0;

    final score = (aniListScore + malScore) / 2;

    String releaseDate = '';

    final releaseDateRaw = DateTime.tryParse(json['release_date'] ?? '');
    if (releaseDateRaw != null) {
      releaseDate = DateFormat('dd/MM/yyyy').format(releaseDateRaw);
    }

    String trailerUrl = '';
    final trailerId = json['trailer'] ?? '';

    if (trailerId != null) {
      trailerUrl = 'https://www.youtube.com/watch?v=$trailerId';
    }

    return Anime(
      name: json['name'] ?? '',
      altName: json['english_name'] ?? '',
      score: score,
      episodes: json['episodes'] ?? '',
      releaseDate: releaseDate,
      trailerUrl: trailerUrl,
      genres: ((json['genres'] ?? []) as List).map((e) => e.toString()).toList(),
    );
  }
}
