import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/services/notes_service.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesIdleState()) {
    on<NotesAddNewNoteEvent>((event, emit) async {
      emit(NotesSaveInProgressState());

      bool result = await NotesService.addNewNote(event.noteText);

      if (result) {
        emit(NotesSaveSuccessState());
      } else {
        emit(NotesSaveErrorState());
      }

      emit(NotesIdleState());
    });
  }
}
