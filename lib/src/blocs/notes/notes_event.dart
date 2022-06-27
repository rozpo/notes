part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotesAddNewNoteEvent extends NotesEvent {
  final String noteText;

  NotesAddNewNoteEvent({
    required this.noteText,
  });
}
