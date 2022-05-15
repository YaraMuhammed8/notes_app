import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/remote/dio/dio_helper.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context) => BlocProvider.of(context);
  List<Note> notes = [];
  void getNotes({required String token}) {
    emit(GetNotesLoadingState());
    DioHelper.getData(url: "note/", token: token).then((value) {
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
    emit(PostNoteLoadingState());
    DioHelper.postData(url: "note/", data: newNote, token: token).then((value) {
      Fluttertoast.showToast(
          msg: "note added successfully", backgroundColor: Colors.black45);
      emit(PostNoteSuccessfulState());
      getNotes(token: token);
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "sorry ,an error has occurred", backgroundColor: Colors.black45);
      emit(PostNoteErrorState());
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
