import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  final TextEditingController noteTextFieldController;

  const NoteTextField({
    Key? key,
    required this.noteTextFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: noteTextFieldController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      minLines: 3,
      maxLines: null,
    );
  }
}
