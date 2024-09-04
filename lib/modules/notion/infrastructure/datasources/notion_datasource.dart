import '../../../../entities/old_anime.dart';

abstract class NotionDatasource {
  Future<String> call(OldAnime anime);
}
