import 'package:pami_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.accessToken});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(accessToken: json['accessToken']);
}
