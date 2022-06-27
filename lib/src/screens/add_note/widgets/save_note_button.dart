import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/notes/notes_bloc.dart';

class SaveNoteButton extends StatelessWidget {
  final TextEditingController noteTextFieldController;

  const SaveNoteButton({
    Key? key,
    required this.noteTextFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesBloc, NotesState>(
      listener: (context, state) {
        if (state is NotesSaveSuccessState) {
          Navigator.pop(context);
        } else if (state is NotesSaveErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to save a note. Try again.'),
            ),
          );
        }
      },
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesSaveInProgressState) {
            return const IconButton(
              onPressed: null,
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return IconButton(
              onPressed: () {
                if (noteTextFieldController.text.isNotEmpty) {
                  BlocProvider.of<NotesBloc>(context).add(
                    NotesAddNewNoteEvent(
                        noteText: noteTextFieldController.text),
                  );
                }
              },
              icon: const Icon(Icons.save),
            );
          }
        },
      ),
    );
  }
}
