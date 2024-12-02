import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

late int selectedIndex;

class _EditNoteColorState extends State<EditNoteColor> {
  @override
  void initState() {
    selectedIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {
                  selectedIndex = index;

                  widget.note.color = kColors[index].value;

                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  isSelected: selectedIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
