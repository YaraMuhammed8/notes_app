import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_theme/app_colors.dart';
import 'package:notes_app/bloc/note/note_cubit.dart';
import '../models/note.dart';
import 'components/change_date_format.dart';

class EditNoteScreen extends StatelessWidget {
  Note note;
  TextEditingController noteBodyController = TextEditingController();

  EditNoteScreen({Key? key, required this.note}) : super(key: key) {
    noteBodyController.text = note.notebody;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NoteCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  // to undo changes
                  cubit.checkChangingNoteBody("", "");
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
              (cubit.noteBodyIsChanged)
                  ? IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: const Text(
                                      "Do you want to save changes ?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("no")),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text("yes")),
                                  ],
                                ));
                      },
                      icon: Icon(
                        Icons.check_rounded,
                      ))
                  : Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.check_rounded, color: Colors.grey),
                    ),
            ],
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  note.title,
                  style: TextStyle(color: AppColors.bluePrimaryColor),
                ),
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Text(
                    changeDateFormat(note.Date!),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: noteBodyController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) {
                cubit.checkChangingNoteBody(note.notebody, value);
                print(cubit.noteBodyIsChanged);
                print("${note.notebody}");
                print("$value");
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          )),
        );
      },
    );
  }
}
