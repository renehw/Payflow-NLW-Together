import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;
  static SharedPreferences? instance;
  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    instance = await SharedPreferences.getInstance();
    await instance!.setString('user', user.toJson());

    return;
  }

  Future<void> currentUser(BuildContext context) async {
    instance = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2));
    if (instance!.containsKey('user')) {
      final json = instance!.get('user') as String;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
      return;
    }
  }
}
