import 'package:drift/drift.dart';

class Schedule extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get statrTime => integer()();
  IntColumn get ednTime => integer()();
}
