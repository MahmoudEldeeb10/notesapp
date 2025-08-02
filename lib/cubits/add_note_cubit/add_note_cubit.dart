import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constsnts.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  AddNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.isBoxOpen(kNotesBox)
          ? Hive.box<NoteModel>(kNotesBox)
          : await Hive.openBox<NoteModel>(kNotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';
// import 'package:notes_app/constsnts.dart';
// import 'package:notes_app/models/note_model.dart';

// part 'add_note_state.dart';

// class AddNoteCubit extends Cubit<AddNoteState> {
//   AddNoteCubit() : super(AddNoteInitial());

//   AddNote(NoteModel note) async {
//     emit(AddNoteLoading());
//     try {
//       var notesBox = Hive.box(kNotesBox);
//       await notesBox.add(note);
//       emit(AddNoteSuccess());
//     } catch (e) {
//       emit(AddNoteFailure(e.toString()));
//     }
//   }
// }
