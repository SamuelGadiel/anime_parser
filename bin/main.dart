import 'dart:io';

import 'package:anime_parser/anime_parser.dart';
import 'package:anime_parser/core/globals/globals.dart';
import 'package:anime_parser/modules/anime/domain/entities/anime.dart';

Future<void> main(List<String> arguments) async {
  // final animeTest = OldAnime(
  //   name: 'Yuru Camp',
  //   altName: 'Laid-Back Camp',
  //   score: 8.20,
  //   episodes: '26',
  //   releaseDate: '04/01/2018',
  //   trailerUrl: 'https://www.youtube.com/watch?v=1GnPdVAJm5U',
  //   genres: [
  //     'Adventure',
  //     'Comedy',
  //     'Slice of Life',
  //   ],
  // );

  // await publish(animeTest);

  // exit(0);

  final animeName = appController.getAnimeName(arguments);

  await authenticationController.getApiKey();

  Anime? anime;

  while (anime == null) {
    anime = await searchAnime(animeName);
  }

  stdout.write('\n');
  stdout.writeln(anime);

  // print('API-KEY: $apiKey');
}
