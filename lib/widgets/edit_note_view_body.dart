import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
