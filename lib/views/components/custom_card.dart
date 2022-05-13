import 'package:flutter/material.dart';
import 'package:notes_app/components/navigation_functions.dart';
import 'package:notes_app/views/components/change_date_format.dart';
import 'package:notes_app/views/edit_note_screen.dart';

import '../../models/note.dart';

class CustomCard extends StatelessWidget {
  Note note;
  CustomCard({Key? key, required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          navigateWithBack(context, EditNoteScreen(note: note));
        },
        title: Text(note.title),
        subtitle: Text(
          note.body,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(changeDateFormat(note.date!)),
            Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey,)
          ],
        ),
        leading: const Icon(
          Icons.sticky_note_2_outlined,
        ),
      ),
    );
  }
}