

import 'package:firebase_database/firebase_database.dart';

import '../entity/notes.dart';

class NotesDaoRepository {

  var refNotes = FirebaseDatabase.instance.ref().child("note");


  Future<void> noteRecord(String note_title,String note_content) async {
    var info = Map<String,dynamic>();
    info["note_id"]="";
    info["note_title"]=note_title;
    info["note_content"]=note_content;
    refNotes.push().set(info);
  }

  Future<void> noteUpdate(String note_id,String note_title,String note_content) async {
    var info = Map<String,dynamic>();

    info["note_title"]=note_title;
    info["note_content"]=note_content;
    refNotes.child(note_id).update(info);
  }

  Future<void> noteDelete(String note_id) async {
    refNotes.child(note_id).remove();
  }

}