class User {
  User({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });
  late final String firstname;
  late final String lastname;
  late final String email;
  late final String password;
  late final int? id;

  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}