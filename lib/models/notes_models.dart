class NotesModels {

  int? id;
  final String title,desc;
  NotesModels({this.id,required this.title,required this.desc});

  factory NotesModels.fromMap(map) => NotesModels(
    id:map["id"],
    title:map["title"],
    desc:map["desc"]
  );
  Map<String,dynamic> toMap()=> {
    "title":title,
    "desc":desc,
  };

}
