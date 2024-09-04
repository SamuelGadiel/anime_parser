import '../../../../entities/old_anime.dart';

class NotionDataMapper {
  static Map<String, dynamic> toJson(OldAnime anime, String databaseId) {
    return {
      'parent': {
        'database_id': databaseId,
      },
      'properties': {
        'Nome': {
          'title': [
            {
              'text': {
                'content': anime.name,
              }
            }
          ]
        },
        'Nome Alt': {
          'rich_text': [
            {
              'type': 'text',
              'text': {
                'content': anime.altName,
              }
            }
          ]
        },
        'Gênero': {
          'multi_select': anime.genres,
        },
        'Score': {
          'number': anime.score,
        },
        'Episódios': {
          'number': anime.episodes,
        },
        'Trailer': {
          'url': anime.trailerUrl,
        },
        'Lançamento': {
          'date': {
            'start': '2023-02-23',
          }
        }
      }
    };
  }
}
