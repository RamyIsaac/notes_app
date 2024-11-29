import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const EditNoteView();
          }),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, left: 16, bottom: 16),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
              subtitle: Text(
                note.content,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 16),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 30),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
