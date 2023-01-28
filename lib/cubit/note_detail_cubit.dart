import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/notesdao_repository.dart';




class noteDetailCubit extends Cubit<void> {
  noteDetailCubit() : super(0);

  var krepo = NotesDaoRepository();

  Future<void> update(String note_id,String note_title,String note_content) async {
    await krepo.noteUpdate(note_id, note_title, note_content);
  }
}