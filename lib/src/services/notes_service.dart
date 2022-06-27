import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../models/note.dart';

abstract class NotesService {
  static const String _boxName = 'notes';
  static late Box _box;

  static Future<void> init() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();

    Hive.init(appDirectory.path);
    Hive.registerAdapter(NoteAdapter());

    _box = await Hive.openBox(_boxName);
  }

  static ValueListenable<Box<dynamic>> listen() {
    return NotesService._box.listenable();
  }

  // Add a new note to persistency,
  // return TRUE for success or FALSE for any kind of error
  static Future<bool> addNewNote(String noteContent) async {
    // Simulate saving result.
    bool result = Random().nextBool();
    await Future.delayed(const Duration(seconds: 1));

    if (result) {
      _box.add(Note(noteContent, DateTime.now()));
    }

    return result;
  }

  static Note read(int index) {
    return _box.getAt(index);
  }

  static List<Note> readAll() {
    return _box.values.toList() as List<Note>;
  }

  static update(int index, String noteContent) {
    _box.putAt(index, Note(noteContent, DateTime.now()));
  }

  static delete(int index) {
    _box.deleteAt(index);
  }
}
