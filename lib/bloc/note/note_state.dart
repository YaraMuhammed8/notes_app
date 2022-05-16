part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}
class GetNotesLoadingState extends NoteState {}
class GetNotesSuccessfulState extends NoteState {}
class GetNotesErrorState extends NoteState {}
class AddNoteLoadingState extends NoteState {}
class AddNoteSuccessfulState extends NoteState {}
class AddNoteErrorState extends NoteState {}
class FilterSearchList extends NoteState {}
class NoteBodyChanged extends NoteState {}