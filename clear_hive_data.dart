import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:logger/logger.dart';

Future<void> main() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  var boxNames = await Hive.openBox('boxNames');
  for (var boxName in boxNames.keys) {
    var box = await Hive.openBox(boxName);
    await box.clear();
    await box.close();
  }

  var logger = Logger();
  logger.i('Hive data cleared!');
  exit(0);
}
