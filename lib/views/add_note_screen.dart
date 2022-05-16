import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_theme/app_colors.dart';
import 'package:notes_app/bloc/note/note_cubit.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/local/shared_preferences/cache_helper.dart';
import 'package:notes_app/views/components/custom_button.dart';
import 'package:notes_app/views/components/custom_text_field.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.bluePrimaryColor, const Color(0xff90BAC4)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: const Text(
            "Add Note",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
        ),
        body: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = NoteCubit.get(context);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Title"),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextFormField(
                                controller: titleController,
                                keyboardType: TextInputType.name,
                                hintText: "type title of the note ...",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Body"),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextFormField(
                                controller: bodyController,
                                keyboardType: TextInputType.multiline,
                                expandField: true,
                                hintText: "type the note here ... ",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              (state is AddNoteLoadingState)
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : CustomButton(
                                      onPress: () {
                                        if (_formKey.currentState!.validate()) {
                                          print(titleController.text);
                                          print(bodyController.text);
                                          Note newNote = Note(
                                              title: titleController.text,
                                              notebody: bodyController.text,
                                              userid: CacheHelper.getData(
                                                  key: "token"));
                                          cubit.addNote(
                                              newNote: newNote.toJson(),
                                              token: CacheHelper.getData(
                                                  key: "token"));
                                          print(newNote.toJson());
                                        }
                                      },
                                      text: "Add")
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}