import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../entity/notes.dart';
import '../repo/notesdao_repository.dart';

class HomepageCubit extends Cubit<List<Notes>> {
  HomepageCubit() : super(<Notes>[]);

  var krepo = NotesDaoRepository();
  var refNotes = FirebaseDatabase.instance.ref().child("note");

  Future<void> notesUpload() async {
    refNotes.onValue.listen((event) {
      var incomingValues = event.snapshot.value as dynamic;
      if(incomingValues != null){
        var list = <Notes>[];
        incomingValues.forEach((key,object){
          var note = Notes.fromJson(key, object);
          list.add(note);
        });
        emit(list);
      }
    });
  }

  Future<void> search(String searchWord) async {
    refNotes.onValue.listen((event) {
      var incomingValues = event.snapshot.value as dynamic;
      if(incomingValues != null){
        var list = <Notes>[];
        incomingValues.forEach((key,object){
          var note = Notes.fromJson(key, object);
          if(note.note_title.contains(searchWord)){
            list.add(note);
          }
        });
        emit(list);
      }
    });
  }

  Future<void> delete(String note_id) async {
    await krepo.noteDelete(note_id);

  }
}