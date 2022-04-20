import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widget/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widget/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widget/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40.0,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) => BoletoInfoWidget(size: boletos.length),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
            child: Row(
              children: [
                Text(
                  'Meus boletos',
                  style: AppTextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0, bottom: 12.0),
            child: Divider(
              color: AppColors.stroke,
              thickness: 1.0,
              height: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BoletoListWidget(controller: controller),
          ),
        ],
      ),
    );
  }
}
