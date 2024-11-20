import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NoteModalBottomSheet extends StatelessWidget {
  const NoteModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
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
              padding: EdgeInsets.all(16),
              child: CustomButton(),
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
