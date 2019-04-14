/// Returns the last file type found in [path] (example: '.png').
///
/// ```dart
/// getLastFileType('app/src/Procfile'); // Procfile
/// getLastFileType('myFile.first.second'); // .second
/// ```
String getLastFileType(String path) {
  final parts = _getFileFromPath(path).split('.');
  return '${parts.length == 1 ? '' : '.'}${parts.elementAt(parts.length - 1)}';
}

/// Returns all the file types of the file at [path].
///
/// ```dart
/// getAllFileTypes('LICENSE'); // LICENSE
/// getAllFileTypes('files/myFile.first.second'); // .first.second
/// ```dart
String getAllFileTypes(String path) {
  path = _getFileFromPath(path);
  final match = RegExp(r'\..*').firstMatch(path);
  return match == null ? path : path.substring(match.start, match.end);
}

/// Returns the file's name from [path] (example: cat.gif from images/cat.gif).
String _getFileFromPath(String path) {
  final parts = path.split('/');
  return parts.elementAt(parts.length - 1);
}
