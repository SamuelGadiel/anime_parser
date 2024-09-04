import 'dart:io';

import '../../domain/entities/anime.dart';
import '../../domain/failures/no_anime_found_failure.dart';
import '../../domain/usecases/search_anime.dart';

class AnimeController {
  final SearchAnime usecase;

  AnimeController(this.usecase);

  Future<Anime> searchAnime(String animeName) async {
    stdout.writeln('Buscando anime');

    Anime? anime;
    String query = animeName;

    while (anime != null) {
      final result = await usecase(query);

      result.fold(
        (l) {
          switch (l.runtimeType) {
            case NoAnimeFoundFailure:
              stdout.writeln(l.message);

              String newQuery = '';

              while (newQuery.isEmpty) {
                stdout.write('Busque novamente:\t');
                newQuery = stdin.readLineSync() ?? '';
              }

              query = newQuery;
              break;

            default:
              stdout.writeln(l.message);
              exit(1);
          }
        },
        (r) {
          só falta isso!
        },
      );
    }

    return anime!;
  }
}
