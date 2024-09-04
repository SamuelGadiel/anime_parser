import 'package:intl/intl.dart';

class OldAnime {
  final String name;
  final String altName;
  final List<String> genres;
  final double score;
  final String episodes;
  final String releaseDate;
  final String trailerUrl;

  OldAnime({
    required this.name,
    required this.altName,
    required this.score,
    required this.episodes,
    required this.releaseDate,
    required this.trailerUrl,
    required this.genres,
  });

  static OldAnime fromJson(Map<String, dynamic> json) {
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

    return OldAnime(
      name: json['name'] ?? '',
      altName: json['english_name'] ?? '',
      score: score,
      episodes: json['episodes'] ?? '',
      releaseDate: releaseDate,
      trailerUrl: trailerUrl,
      genres: ((json['genres'] ?? []) as List).map((e) => e.toString()).toList(),
    );
  }

  @override
  String toString() {
    String genresText = genres.reversed.fold('', (previousValue, element) => '$element, $previousValue');
    genresText = genresText.substring(0, genresText.length - 2);

    return 'Nome: $name\nNome Alt: $altName\nPontuação: $score\nGêneros: $genresText\nEpisódios: $episodes\nData de lançamento: $releaseDate\nTrailer: $trailerUrl';
  }
}
