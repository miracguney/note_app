import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/notesdao_repository.dart';

class NoteRecordCubit extends Cubit<void> {
  NoteRecordCubit() : super(0);

  var krepo = NotesDaoRepository();

  Future<void> record(String note_title,String note_content) async {
    await krepo.noteRecord(note_title, note_content);
  }
}