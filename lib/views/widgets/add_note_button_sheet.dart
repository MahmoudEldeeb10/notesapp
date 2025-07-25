import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_buttom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              CustomTextField(hintText: 'Title'),
              SizedBox(height: 16),
              CustomTextField(hintText: 'Comtent', maxLines: 5),
              SizedBox(height: 32),
              CustomButtom(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
