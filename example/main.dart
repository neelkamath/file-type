import 'dart:io';

import 'package:file_type/file_type.dart';

main() => Directory.current.list(recursive: true).listen((entity) {
      if (entity is File && getLastFileType(entity.path) == '.dart') {
        print('Dart file found! ${entity.path}');
      }
    });
