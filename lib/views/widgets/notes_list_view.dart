import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NotesSuccess) {
          List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;
          if (notes.isEmpty) {
            return Center(
              child: Text(
                'No notes yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(note: notes[index]),
                );
              },
            ),
          );
        } else if (state is NotesFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
