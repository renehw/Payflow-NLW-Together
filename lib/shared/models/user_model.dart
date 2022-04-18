import 'dart:convert';
import 'package:payflow/shared/auth/app.dart';

class UserModel {
  static final _cache = App.cache;
  final String? name;
  final String? phothURL;

  UserModel({required this.name, this.phothURL});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], phothURL: 'photoURL');
  }

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'name': name,
        'photoURL': phothURL,
      };

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromCache() {
    return UserModel(
      name: _cache!.getString('name'),
      phothURL: _cache!.getString('photoURL'),
    );
  }
}
