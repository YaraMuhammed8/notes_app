import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/note/note_cubit.dart';
import 'package:notes_app/components/navigation_functions.dart';
import 'package:notes_app/views/add_note_screen.dart';
import 'package:notes_app/views/components/app_logo.dart';
import 'package:notes_app/views/components/custom_list_view.dart';
import 'package:notes_app/views/components/search_field.dart';
import 'package:notes_app/views/login_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController searchFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content: const Text(
                              "Do you want to logout from your account?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  navigateWithoutBack(context, LoginScreen());
                                },
                                child: const Text("Logout")),
                          ],
                        ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NoteCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: (state is GetNotesLoadingState)
                  ? const CircularProgressIndicator()
                  : (cubit.notes!.isEmpty)
                      ? const Text("No notes")
                      : Column(
                          children: [
                            SearchField(
                              controller: searchFieldController,
                              hintText: "Search notes ...",
                              onChanged: (keyword) {
                                cubit.filterNotes(keyword);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: (cubit.notesSearchResult.isEmpty &&
                                      searchFieldController.text.isNotEmpty)
                                  ? const Center(child: Text("No notes"))
                                  : (cubit.notesSearchResult.isEmpty)
                                      ? CustomListView(list: cubit.notes!)
                                      : CustomListView(
                                          list: cubit.notesSearchResult),
                            ),
                          ],
                        ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}