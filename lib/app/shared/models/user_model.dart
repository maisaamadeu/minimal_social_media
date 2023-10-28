class UserModel {
  late String id;
  late String username;
  late String email;
  late String token;

  UserModel({required this.id, required this.username, required this.email, required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['token'] = token;
    return _data;
  }
}

