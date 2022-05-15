class Note {
  Note({
     this.id,
    required this.title,
    required this.notebody,
     this.userid,
     this.Date,
     this.V,
  });
  late final String? id;
  late final String title;
  late final String notebody;
  late final String? userid;
  late final String? Date;
  late final int? V;

  Note.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    notebody = json['notebody'];
    userid = json['userid'];
    Date = json['Date'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['notebody'] = notebody;
    _data['userid'] = userid;
    _data['Date'] = Date;
    _data['__v'] = V;
    return _data;
  }
}