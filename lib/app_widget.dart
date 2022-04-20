import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/login/login_pages.dart';
import 'package:payflow/shared/auth/app.dart';
import 'package:payflow/shared/auth/sessao.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      debugShowCheckedModeBanner: false,
      navigatorKey: App.navigator,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      home: Consumer<Sessao>(builder: (context, sessao, _) {
        if (!App.sessao.logado) {
          return const LoginPage();
        }

        return const HomePage();
      }),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/barcode_scanner': (context) => const BarcodeScannerPage(),
        '/insert_boleto': (context) => const InsertBoletoPage(),
      },
    );
  }
}
