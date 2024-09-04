import 'package:dio/dio.dart';

import '../../../../core/globals/constants.dart';
import '../../../../entities/old_anime.dart';
import '../../infrastructure/datasources/notion_datasource.dart';
import '../../infrastructure/errors/notion_error.dart';
import '../../infrastructure/mappers/notion_data_mapper.dart';
import '../settings/notion_settings.dart';

class NotionDatasourceImplementation implements NotionDatasource {
  final Dio dio;

  NotionDatasourceImplementation(this.dio);

  @override
  Future<String> call(OldAnime anime) async {
    final response = await dio.post(
      NotionSettings.endpoint,
      data: NotionDataMapper.toJson(anime, Constants.animesDatabaseId),
      options: Options(headers: NotionSettings.headers),
    );

    if (response.statusCode != 200) {
      String message = 'Houve um erro no envio de dados para o Notion';

      if (response.data['message'] != null) {
        message = response.data['message'];
      }

      throw NotionError(message);
    }

    return '${anime.name} registrado com sucesso!';
  }
}
