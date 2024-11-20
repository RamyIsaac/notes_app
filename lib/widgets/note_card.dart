import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

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
            color: Colors.amber, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Flutter Tip',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
              subtitle: Text(
                'Use SOLID principles while building your apps',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 16),
              ),
              trailing: IconButton(
                onPressed: () {},
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
                'AUG 7 , 2003',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
