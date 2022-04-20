import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/auth/sessao.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final Sessao user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152.0),
        child: Container(
          height: 152.0,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(text: '${widget.user.user}', style: AppTextStyles.titleBoldBackground),
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.user.photoURL!),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: [
        MeusBoletosPage(key: UniqueKey()),
        ExtractPage(key: UniqueKey()),
      ][controller.currentPage],
      bottomNavigationBar: SizedBox(
        height: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: controller.currentPage == 0 ? AppColors.primary : AppColors.body,
              ),
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
            ),
            GestureDetector(
              onTap: (() async {
                await Navigator.pushNamed(context, '/barcode_scanner');
                setState(() {});
              }),
              child: Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1 ? AppColors.primary : AppColors.body,
              ),
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
