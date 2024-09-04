import 'package:dio/dio.dart';

import '../../domain/entities/anime.dart';
import '../../intrastructure/datasources/anime_datasource.dart';
import '../../intrastructure/errors/anime_error.dart';
import '../../intrastructure/errors/no_anime_found_error.dart';
import '../../intrastructure/mappers/anime_mapper.dart';
import '../settings/anime_settings.dart';

class AnimeDatasourcesImplementation implements AnimeDatasource {
  final Dio dio;

  AnimeDatasourcesImplementation(this.dio);

  @override
  Future<List<Anime>> call(String query) async {
    final response = await dio.get(
      AnimeSettings.endpoint,
      options: Options(headers: AnimeSettings.headers),
      queryParameters: {'keyword': query},
    );

    if (response.statusCode != 200) {
      String message = '';

      final error = response.data['error'];

      if (error != null) {
        final String status = (error['status'] ?? '').toString();
        final String reason = (error['reason'] ?? '').toString();
        final String errorMessage = (error['message'] ?? '').toString();

        if (status.isNotEmpty || reason.isNotEmpty || errorMessage.isNotEmpty) {
          message = '$status $reason - $errorMessage';
        }
      }

      throw AnimeError(message);
    }

    final animesList = ((response.data['results'] ?? []) as List).map((e) => AnimeMapper.fromJson(e)).toList();

    switch (animesList.length) {
      case 0:
        throw NoAnimeFoundError('No anime was found');
      case 1:
        return [animesList.first];
      default:
        return animesList.take(10).toList();
    }
  }
}
