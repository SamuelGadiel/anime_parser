import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../../../../entities/old_anime.dart';
import '../../domain/failures/notion_failure.dart';
import '../../domain/repositories/notion_repository.dart';
import '../datasources/notion_datasource.dart';
import '../errors/notion_error.dart';

class NotionRepositoryImplementation implements NotionRepository {
  final NotionDatasource datasource;

  NotionRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, String>> call(OldAnime anime) async {
    try {
      return Right(await datasource(anime));
    } on NotionError catch (e) {
      return Left(NotionFailure(e.message));
    } on Exception catch (e) {
      return Left(NotionFailure(e.toString()));
    }
  }
}
