import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

final GlobalKey<FormState> formKey = GlobalKey();
String? title, content;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            label: 'Title',
          ),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            label: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formattedCurrentDate =
                          DateFormat('dd-MM-yyyy At HH:mm ')
                              .format(currentDate);
                      var noteModel = NoteModel(
                          title: title!,
                          content: content!,
                          date: formattedCurrentDate,
                          color: Colors.amber.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 36,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 36,
          );
  }
}
