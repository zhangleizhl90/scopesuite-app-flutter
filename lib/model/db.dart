import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> createDb(String dbName) async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  String path = join(documentsDirectory.path, dbName);
  if (await new Directory(dirname(path)).exists()) {
    await deleteDatabase(path);
  } else {
    try {
      await new Directory(dirname(path)).create(recursive: true);
    } catch(e) {
      print(e);
    }
  }
  return path;
}