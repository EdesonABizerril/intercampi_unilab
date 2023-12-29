import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../helpers/helpers.dart';
import '../../routes/routes.dart';
import '../components/components.dart';
import '../theme/theme.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              const MainAppBar(),
              const SizedBox(height: 32),
              Text(
                "select_a_route".tr,
                style: AppStyle.h3.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    AppCardSelect(
                      onTap: () {
                        AppNavigator.to.route(
                          type: BusLines.liberdadePalmares,
                        );
                      },
                      from: "Liberdade",
                      to: "Palmares",
                      backgroundColor: BusLines.liberdadePalmares.color,
                      icon: const Icon(
                        Icons.compare_arrows_rounded,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    AppCardSelect(
                      onTap: () {
                        AppNavigator.to.route(
                          type: BusLines.liberdadeAuroras,
                        );
                      },
                      from: "Liberdade",
                      to: "Auroras",
                      backgroundColor: BusLines.liberdadeAuroras.color,
                      icon: const Icon(
                        Icons.compare_arrows_rounded,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    AppCardSelect(
                      onTap: () {
                        AppNavigator.to.route(
                          type: BusLines.aurorasPalmares,
                        );
                      },
                      from: "Auroras",
                      to: "Palmares",
                      backgroundColor: BusLines.aurorasPalmares.color,
                      icon: const Icon(
                        Icons.compare_arrows_rounded,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "data_updated_in".tr.replaceFirst("##", controller.dateUpdate.ddMMMyyyy),
                style: AppStyle.body,
              ),
              const SizedBox(height: 32),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.borderGrey,
                    width: 1,
                  ),
                ),
                child: Obx(
                  () => HtmlWidget(
                    controller.tipesIntercampi,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
