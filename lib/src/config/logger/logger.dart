import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount:
        2, // Increase methodCount to show the method calls leading to the error
    errorMethodCount:
        8, // Increase errorMethodCount to show more lines in the stack trace
    lineLength: 50,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
);
