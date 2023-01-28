import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/note_record_cubit.dart';

class NoteRecordPage extends StatefulWidget {
  const NoteRecordPage({Key? key}) : super(key: key);

  @override
  State<NoteRecordPage> createState() => _NoteRecordPageState();
}

class _NoteRecordPageState extends State<NoteRecordPage> {
  var tfNoteTitle = TextEditingController();
  var tfNoteContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff040938),
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation:0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: const Text("Add Note",style:TextStyle(color: Colors.white,fontSize: 35),),
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
                  context.read<NoteRecordCubit>().record(tfNoteTitle.text, tfNoteContent.text);
                }, child: const Text("ADD NOTE"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff4717f3),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}