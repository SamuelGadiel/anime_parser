class Anime {
  final String name;
  final String altName;
  final List<String> genres;
  final double score;
  final String episodes;
  final String releaseDate;
  final String trailerUrl;

  Anime({
    required this.name,
    required this.altName,
    required this.score,
    required this.episodes,
    required this.releaseDate,
    required this.trailerUrl,
    required this.genres,
  });

  @override
  String toString() {
    String genresText = genres.reversed.fold('', (previousValue, element) => '$element, $previousValue');
    genresText = genresText.substring(0, genresText.length - 2);

    return 'Nome: $name\nNome Alt: $altName\nPontuação: $score\nGêneros: $genresText\nEpisódios: $episodes\nData de lançamento: $releaseDate\nTrailer: $trailerUrl';
  }
}
