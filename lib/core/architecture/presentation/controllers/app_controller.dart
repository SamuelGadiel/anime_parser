import 'dart:io';

class AppController {
  String getAnimeName(List<String> arguments) {
    String anime = '';

    if (arguments.isNotEmpty) {
      anime = arguments.join(' ');
    }

    while (anime.isEmpty) {
      stdout.write('Which anime?\t');
      anime = stdin.readLineSync() ?? '';
    }

    return anime;
  }
}
