import 'package:flutter/material.dart';

import 'widgets/note_text_field.dart';
import 'widgets/save_note_button.dart';

class AddNoteScreen extends StatelessWidget {
  final String _screenDisplayName = 'Add Note';
  final TextEditingController _textEditingController = TextEditingController();

  AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_screenDisplayName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SaveNoteButton(
              noteTextFieldController: _textEditingController,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NoteTextField(
          noteTextFieldController: _textEditingController,
        ),
      ),
    );
  }
}
