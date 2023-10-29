import 'package:minimal_social_media/app/shared/models/user_model.dart';

class PostModel {
  PostModel({
    required this.id,
    required this.message,
    required this.createdAt,
    required this.user,
  });
  late final String id;
  late final String message;
  late final String createdAt;
  late final UserModel user;

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    createdAt = json['createdAt'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['message'] = message;
    _data['createdAt'] = createdAt;
    _data['user'] = user.toJson();
    return _data;
  }
}
