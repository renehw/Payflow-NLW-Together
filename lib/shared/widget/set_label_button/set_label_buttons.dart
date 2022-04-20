import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widget/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widget/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 1.0,
            height: 1.0,
            color: AppColors.stroke,
          ),
          SizedBox(
            height: 56.0,
            child: Row(
              children: [
                Expanded(
                  child: LabelButton(
                    label: primaryLabel,
                    onPressed: primaryOnPressed,
                    style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
                const DividerVerticalWidget(),
                Expanded(
                  child: LabelButton(
                    label: secondaryLabel,
                    onPressed: secondaryOnPressed,
                    style: enableSecondaryColor ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
