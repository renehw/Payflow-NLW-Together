import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/auth/sessao.dart';
import 'package:payflow/shared/widget/boleto_list/boleto_list_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  static final App instance = App();
  static final navigator = GlobalKey<NavigatorState>();

  static SharedPreferences? cache;
  static BuildContext context = navigator.currentState!.overlay!.context;
  static Sessao sessao = Sessao.instance;

  Future<void> inicializar() async {
    cache = await SharedPreferences.getInstance();
  }

  static Future navigate(Widget widget, {bool slide = false, bool menu = false, bool voltar = true}) async {
    if (menu) {
      Navigator.pop(context);
    }

    if (!voltar) {
      return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false,
      );
    } else if (slide) {
      return Navigator.of(context).push(CupertinoPageRoute(
        builder: (BuildContext context) => widget,
      ));
    } else {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ));
    }
  }
}
