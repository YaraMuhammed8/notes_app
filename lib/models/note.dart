class Note {
  Note({
     this.id,
    required this.title,
    required this.body,
     this.date,
     this.comments,
     this.V,
  });
  late final String? id;
  late final String title;
  late final String body;
  late final String? date;
  late final List<dynamic>? comments;
  late final int? V;

  Note.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    body = json['body'];
    date = json['date'];
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['body'] = body;
    _data['date'] = date;
    _data['comments'] = comments;
    _data['__v'] = V;
    return _data;
  }
}