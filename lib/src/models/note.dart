import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String content;

  @HiveField(1)
  final DateTime creationTime;

  Note(
    this.content,
    this.creationTime,
  );
}
