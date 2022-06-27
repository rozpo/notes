part of 'notes_bloc.dart';

@immutable
abstract class NotesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotesIdleState extends NotesState {}

class NotesSaveInProgressState extends NotesState {}

class NotesSaveSuccessState extends NotesState {}

class NotesSaveErrorState extends NotesState {}
