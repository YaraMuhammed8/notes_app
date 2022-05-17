import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/remote/dio/dio_helper.dart';

import '../../components/toast_message.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context) => BlocProvider.of(context);
  List<Note> notes = [];
  void getNotes({required String token}) {
    emit(GetNotesLoadingState());
    notes = [];
    DioHelper.getData(url: "note/", token: token).then((value) {
      print(value.data);
      notes = List.from(value.data).map((e) => Note.fromJson(e)).toList();
      print(notes);
      //notes = List.from(notes.reversed);
      emit(GetNotesSuccessfulState());
    }).catchError((error) {
      print("error of getting notes is: $error");
      emit(GetNotesErrorState());
    });
  }

  void addNote({required dynamic newNote, required String token}) {
    emit(AddNoteLoadingState());
    DioHelper.postData(url: "note/", data: newNote, token: token).then((value) {
      showToastMessage("note added successfully");
      emit(AddNoteSuccessfulState());
      getNotes(token: token);
    }).catchError((error) {
      showToastMessage("sorry ,an error has occurred");
      emit(AddNoteErrorState());
      print("posting note error is : $error");
    });
  }

  List<Note> notesSearchResult = [];
  void filterNotes(String keyword) {
    notesSearchResult = notes
        .where((element) =>
            element.title.toLowerCase().startsWith(keyword.toLowerCase()))
        .toList();
    emit(FilterSearchList());
  }

  bool noteBodyIsChanged = false;
  void checkChangingNoteBody(String originText, String newText) {
    if (originText != newText) {
      noteBodyIsChanged = true;
    } else {
      noteBodyIsChanged = false;
    }
    emit(NoteBodyChanged());
  }
}
