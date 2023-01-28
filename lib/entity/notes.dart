class Notes {
  String note_id;
  String note_title;
  String note_content;

  Notes({required this.note_id,required this.note_title,required this.note_content});

  factory Notes.fromJson(String key,Map<dynamic,dynamic> json){
    return Notes(
    note_id: key,
    note_title: json["note_title"] as String,
    note_content: json["note_content"] as String);
  }
}