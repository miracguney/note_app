import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/homepage.dart';
import 'cubit/homepage_cubit.dart';
import 'cubit/note_detail_cubit.dart';
import 'cubit/note_record_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NoteRecordCubit()),
          BlocProvider(create: (context) => noteDetailCubit()),
          BlocProvider(create: (context) => HomepageCubit()),
    ],
    child: MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    ),
    );
  }
}

