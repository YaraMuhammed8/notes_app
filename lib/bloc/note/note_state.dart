part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}
class GetNotesLoadingState extends NoteState {}
class GetNotesSuccessfulState extends NoteState {}
class GetNotesErrorState extends NoteState {}
class PostNoteLoadingState extends NoteState {}
class PostNoteSuccessfulState extends NoteState {}
class PostNoteErrorState extends NoteState {}
class FilterSearchList extends NoteState {}
class NoteBodyChanged extends NoteState {}