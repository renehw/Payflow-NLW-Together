import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56.0,
              height: 34.0,
            ),
            Container(
              width: 1.0,
              height: 32.0,
              color: AppColors.background,
            ),
            Text.rich(
              TextSpan(
                text: "Você tem ",
                style: AppTextStyles.captionBackground,
                children: [
                  TextSpan(
                    text: size == 1 ? "$size boleto\n" : "$size boletos\n",
                    style: AppTextStyles.captionBoldBackground,
                  ),
                  TextSpan(
                    text: size == 1 ? "cadastrado para pagar" : "cadastrados para pagar",
                    style: AppTextStyles.captionBackground,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
