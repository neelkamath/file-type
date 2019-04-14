import 'package:file_type/file_type.dart';
import 'package:link_checker/link_checker.dart';
import 'package:test/test.dart';

main() {
  test('dead links', () {
    expect(
        getBadLinksInDirectory(blacklistedFiles: ['pubspec.lock']), emitsDone);
  });

  group('check file types when', () {
    group('only the last type should be gotten and', () {
      test('the file is in a directory', () {
        final type = '.png';
        expect(getLastFileType('app/src/cat$type'), type);
      });

      group("there are no types and it's", () {
        final type = 'Procfile';
        test('in a directory',
            () => expect(getLastFileType('app/src/$type'), type));
        test('not in a directory', () => expect(getLastFileType(type), type));
      });

      test('there is one type', () {
        final type = '.gif';
        expect(getLastFileType('cat$type'), type);
      });
      test('there are more than two types', () {
        final type = '.yml';
        expect(getLastFileType('tool.text.circleci$type'), type);
      });
    });

    group('multiple types should be gotten and', () {
      test('the file is in a directory', () {
        final type = '.h.jpeg';
        expect(getAllFileTypes('some/path/img$type'), type);
      });

      group("there are no types and it's", () {
        final type = 'Procfile';
        test('in a directory',
            () => expect(getAllFileTypes('app/src/$type'), type));
        test('not in a directory', () => expect(getAllFileTypes(type), type));
      });

      test('there is one type', () {
        final type = '.png';
        expect(getAllFileTypes('logo$type'), type);
      });
      test('there are more than two types', () {
        final type = '.h.text.markdown';
        expect(getAllFileTypes('myFile$type'), type);
      });
    });
  });
}
