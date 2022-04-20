import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/auth/app.dart';
import 'package:payflow/shared/models/boleto_model.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) => value?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;
  String? validateVencimento(String? value) => value?.isEmpty ?? true ? 'A data de vencimento não pode ser vazio' : null;
  String? valdateValor(double? value) => value == 0 ? 'Insira um valor maior que R\$ 0,00' : null;
  String? validateCodigo(String? value) => value?.isEmpty ?? true ? 'O código do boleto não pode ser vazio' : null;

  void onChange({String? name, String? dueDate, double? value, String? barcode}) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final boletos = App.cache?.getStringList('boletos') ?? <String>[];
    boletos.add(model.toJson());
    await App.cache?.setStringList('boletos', boletos);

    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      return saveBoleto();
    }
  }
}
