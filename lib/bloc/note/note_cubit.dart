import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/remote/dio/dio_helper.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context) => BlocProvider.of(context);
  List<Note>? notes = [];
  void getNotes() {
    emit(GetNotesLoadingState());
    DioHelper.getData(url: "user/").then((value) {
      emit(GetNotesSuccessfulState());
      for (dynamic item in value.data) {
        item = Note.fromJson(item);
        notes!.add(item);
      }
      notes = List.from(notes!.reversed);
      print(" data: ${value.data[0]}");
    }).catchError((error) {
      print("error of getting notes is: $error");
      emit(GetNotesErrorState());
    });
  }

  void addNote(dynamic newNote) {
    emit(PostNoteLoadingState());
    DioHelper.postData(url: "user/", data: newNote).then((value) {
      emit(PostNoteSuccessfulState());
      getNotes();
    }).catchError((error) {
      emit(PostNoteErrorState());
      print("posting note error is : $error");
    });
  }

  List<Note> notesSearchResult = [];
  void filterNotes(String keyword) {
    notesSearchResult = notes!
        .where((element) =>
            element.title.toLowerCase().startsWith(keyword.toLowerCase()))
        .toList();
    emit(FilterSearchList());
  }
}