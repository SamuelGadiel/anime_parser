import 'package:dartz/dartz.dart';

import '../../../../core/architecture/domain/failures/failure.dart';
import '../../../../entities/old_anime.dart';
import '../repositories/notion_repository.dart';

abstract class SubmitNotionData {
  Future<Either<Failure, String>> call(OldAnime anime);
}

class SubmitNotionDataImplementation implements SubmitNotionData {
  final NotionRepository repository;

  SubmitNotionDataImplementation(this.repository);

  @override
  Future<Either<Failure, String>> call(OldAnime anime) async {
    return repository(anime);
  }
}
