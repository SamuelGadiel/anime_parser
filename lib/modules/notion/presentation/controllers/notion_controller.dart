import 'dart:io';

import '../../../../entities/old_anime.dart';
import '../../domain/failures/notion_failure.dart';
import '../../domain/usecases/submit_notion_data.dart';

class NotionController {
  final SubmitNotionData usecase;

  NotionController(this.usecase);

  Future<void> submitToNotion(OldAnime anime) async {
    stdout.writeln('Iniciando envio para Notion');

    final result = await usecase(anime);

    result.fold(
      (l) {
        stdout.writeln((l as NotionFailure).message);
      },
      (r) {
        stdout.writeln(r);
      },
    );
  }
}
