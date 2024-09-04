import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

import 'core/globals/constants.dart';
import 'core/globals/globals.dart';
import 'entities/old_anime.dart';

Future<OldAnime?> searchAnime(String animeName, String apiKey) async {
  final result = await dio.get(
    'Constants.animeSearchUrl',
    options: Options(headers: {'authorization': apiKey}),
    queryParameters: {'keyword': animeName},
  );

  if (result.statusCode != 200) {
    String message = '';

    final error = result.data['error'];

    if (error != null) {
      final String status = (error['status'] ?? '').toString();
      final String reason = (error['reason'] ?? '').toString();
      final String errorMessage = (error['message'] ?? '').toString();

      if (status.isNotEmpty || reason.isNotEmpty || errorMessage.isNotEmpty) {
        message = '$status $reason - $errorMessage';
      }
    }

    throw Exception(message);
  }

  final decodedResponse = jsonDecode(result.data);
  final animesList = (decodedResponse['results'] ?? []) as List;

  switch (animesList.length) {
    case 0:
      throw Exception('No anime was found');
    case 1:
      return OldAnime.fromJson(animesList.first);

    default:
      // for (var anime in animesList) {
      //   if (anime['name'] == animeName || anime['english_name'] == animeName) {
      //     return Anime.fromJson(anime);
      //   }
      // }

      final cappedList = animesList.take(10);

      stdout.writeln('\n0 - Search again\n');

      cappedList.forEachIndexed((index, anime) {
        String altName = '';

        if (anime['english_name'] != null) {
          altName = ' | ${anime['english_name']}';
        }

        stdout.writeln('${index + 1} - ${anime['name']}$altName');
      });

      int index = -1;
      while (index == -1) {
        stdout.write('\nWhich anime is it?\t');

        index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      }

      if (index == cappedList.length + 1) {
        return null;
      }

      return OldAnime.fromJson(cappedList.elementAt(index));
  }
}
