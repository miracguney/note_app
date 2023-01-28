import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/homepage_cubit.dart';
import '../entity/notes.dart';
import 'note_detail_page.dart';
import 'note_record_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool search = false;

  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().notesUpload();
  }

  List<Color> cardColor = [Colors.blue.shade200,Colors.pinkAccent.shade200,Colors.yellow.shade200,Colors.purpleAccent.shade200,Colors.orange.shade200,Colors.green.shade200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff040938),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: search ?
           TextField(style:TextStyle(color: Colors.white),decoration: const InputDecoration(hintText: "Search",hintStyle: TextStyle(color: Colors.white),),
             onChanged: (searchResults){
               context.read<HomepageCubit>().search(searchResults);
             },
           )
         : Padding(
           padding: const EdgeInsets.only(left: 40.0,top: 25.0),
           child: const Text("Notes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
         ),
        actions: [
          search ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              setState((){ search = false;  });
              context.read<HomepageCubit>().notesUpload();
            }, icon: const Icon(Icons.cancel)),
          ) :
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              setState((){ search = true;  });
            }, icon: const Icon(Icons.search)),
          )
        ],
      ),
      body:BlocBuilder<HomepageCubit,List<Notes>>(
        builder: (context,notesList){
          if(notesList.isNotEmpty){
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: notesList.length,
                itemBuilder: (context,index){
                  var note = notesList[index];
                  return Transform.translate(
                    offset: Offset(0.0, index.isOdd ? 0.0 : 30 ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDetailPage(note: note)))
                        .then((value){  print("Homapage return");  });
                      },
                      child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                        color: cardColor[index % cardColor.length],
                        child: Stack(
                          children: [
                            Expanded(
                              child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18.0,left: 8.0,right: 8.0),
                                    child: Text("${note.note_title}",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),maxLines:1,overflow: TextOverflow.ellipsis,),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${note.note_content}",maxLines:5,overflow: TextOverflow.ellipsis,),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: TextButton(onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${note.note_title} silinsin mi?"),
                                    action: SnackBarAction(
                                      label: "EVET",
                                      onPressed: (){
                                        context.read<HomepageCubit>().delete(note.note_id);
                                      },
                                    ),
                                  ),
                                );
                              }, child: const Text("X",style:TextStyle(fontWeight:FontWeight.bold,color: Colors.black,),)),
                            ),
                          ],
                        ),
                      ),

                    ),
                  );
                },
              ),
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff4717f3),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteRecordPage()))
                .then((value){  print("Anasayfaya dönüldü");  });
          },
          child: const Icon(Icons.add),
      ),


    );

  }
}

