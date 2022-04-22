import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/auth/app.dart';
import 'package:payflow/shared/models/boleto_model.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final response = App.cache?.getStringList('boletos') ?? <String>[];
      boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void dispose() {
    boletosNotifier.dispose();
  }
}
