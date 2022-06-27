import 'package:flutter/material.dart';

import 'widgets/add_note_button.dart';
import 'widgets/notes_list.dart';

class HomeScreen extends StatelessWidget {
  final String _screenDisplayName = 'Notes';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.note),
        title: Text(
          _screenDisplayName,
        ),
      ),
      body: const NotesList(),
      floatingActionButton: const AddNoteButton(),
    );
  }
}
