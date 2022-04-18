import 'package:flutter/material.dart';
import 'package:payflow/shared/auth/app.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Icon(Icons.exit_to_app),
              onTap: () {
                App.sessao.logout();
              },
            ),
          ),
        ],
        backgroundColor: AppColors.primary,
        title: const Text('HomePage'),
      ),
    );
  }
}
