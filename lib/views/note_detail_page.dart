import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubit/note_detail_cubit.dart';
import '../entity/notes.dart';

class NoteDetailPage extends StatefulWidget {
  Notes note;
  NoteDetailPage({required this.note});
  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  var tfNoteTitle = TextEditingController();
  var tfNoteContent = TextEditingController();

  @override
  void initState() {
    super.initState();
    var note = widget.note;
    tfNoteTitle.text = note.note_title;
    tfNoteContent.text = note.note_content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff040938),
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation:0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: const Text("Note Detail",style:TextStyle(color: Colors.white,fontSize: 35),),
        ),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18,right: 8,top: 25),
          child: Column(
            children: [
              TextField(
                style:TextStyle(
                color: Colors.white70,fontSize: 28),
                controller: tfNoteTitle,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                    hintText: "Note Title",
                    hintStyle: TextStyle(
                        color: Colors.white54
                    )),
              ),
              SizedBox(height: 20,),
              TextField(
                style:TextStyle(
                    color: Colors.white70,fontSize: 20),
                controller: tfNoteContent,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Note Content",
                    hintStyle: TextStyle(color: Colors.white24)
                ),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  context.read<noteDetailCubit>().update(widget.note.note_id, tfNoteTitle.text, tfNoteContent.text);
                }, child: const Text("UPDATE"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4717f3),
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}