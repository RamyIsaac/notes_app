import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NoteModalBottomSheet extends StatelessWidget {
  const NoteModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextField(
            label: 'Title',
          ),
          CustomTextField(
            label: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10),
            child: CustomButton(),
          ),
        ],
      ),
    );
  }
}
