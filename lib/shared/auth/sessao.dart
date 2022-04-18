import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/auth/app.dart';
import 'package:payflow/shared/models/user_model.dart';

class Sessao extends ChangeNotifier {
  static final _cache = App.cache;

  static final Sessao instance = _cache!.containsKey('name') ? Sessao.fromCache() : Sessao();

  String? user;
  String? photoURL;

  Sessao({
    this.user,
    this.photoURL,
  });

  bool get logado {
    return user != null;
  }

  factory Sessao.fromCache() {
    return Sessao(
      user: _cache?.getString('name'),
      photoURL: _cache?.getString('photoURL'),
    );
  }

  void atualizarSessao({UserModel? user}) {
    if (user != null) {
      this.user = user.name;
      photoURL = user.phothURL;
    }

    notifyListeners();
    gravarCache();
  }

  void logout() {
    user = null;
    photoURL = null;

    _cache!.clear();
    notifyListeners();
  }

  gravarCache() {
    if (user != null) {
      _cache!.setString('name', user ?? '');
      _cache!.setString('photoURL', photoURL ?? '');
    }
  }
}
