import 'dart:convert';

class UserModel {
  final String name;
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
}
