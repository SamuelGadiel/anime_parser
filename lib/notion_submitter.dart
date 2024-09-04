import 'package:notion_api/notion.dart';
import 'package:notion_api/notion/general/lists/properties.dart';
import 'package:notion_api/notion/general/rich_text.dart';
import 'package:notion_api/notion/objects/pages.dart';
import 'package:notion_api/notion/objects/parent.dart';

import 'core/globals/constants.dart';
import 'entities/old_anime.dart';
import 'secrets/secrets.dart';

Future<void> publish(OldAnime anime) async {
  NotionClient notion = NotionClient(token: Secrets.notionAPIKey, dateVersion: '2022-06-28');

  final result = await notion.pages.create(
    Page(
      parent: Parent.database(id: Constants.animesDatabaseId),
      title: Text('Teste'),
    ),
  );

  await notion.pages.update(result.page?.id ?? '', properties: Properties(map: {}));

  print(result);
}
