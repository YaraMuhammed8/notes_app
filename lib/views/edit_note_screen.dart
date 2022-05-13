import 'package:flutter/material.dart';
import 'package:notes_app/app_theme/app_colors.dart';

import '../models/note.dart';
import 'components/change_date_format.dart';

class EditNoteScreen extends StatelessWidget {
  Note note;
  TextEditingController noteBodyController = TextEditingController();
  EditNoteScreen({Key? key, required this.note}) : super(key: key){
    noteBodyController.text = note.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline)),
          IconButton(onPressed: (){}, icon: Icon(Icons.check_rounded)),
        ],
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              note.title,
              style: TextStyle(color: AppColors.bluePrimaryColor),
            ),
            Transform.translate(offset: Offset(0,-10),
              child: Text(changeDateFormat(note.date!),style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
              controller: noteBodyController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )
            ),
          ),
        )
      ),
    );
  }
}