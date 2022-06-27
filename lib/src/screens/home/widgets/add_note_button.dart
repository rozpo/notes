import 'package:flutter/material.dart';

import '../../add_note/add_note_screen.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNoteScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
