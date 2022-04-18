import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_pages.dart';
import 'package:payflow/shared/auth/app.dart';
import 'package:payflow/shared/auth/sessao.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      debugShowCheckedModeBanner: false,
      navigatorKey: App.navigator,
      theme: ThemeData(primaryColor: AppColors.primary),
      home: Consumer<Sessao>(builder: (context, sessao, _) {
        if (!App.sessao.logado) {
          return const LoginPage();
        }

        return const HomePage();
      }),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
