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
      backgroundColor: AppColors.backgroundColor,
      appBar: AppSimpleAppBar(
        title: "Intercampi",
        actions: [
          IconButton(
            onPressed: () {
              sharedTextData(title: "shared".tr, content: "shared_text_with_link".tr);
            },
            icon: const Icon(Icons.share),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "feedback",
                child: Text("feedback".tr),
              ),
              PopupMenuItem(
                value: "about",
                child: Text("about".tr),
              ),
            ],
            onSelected: (value) {
              if (value == "feedback") {}
              if (value == "about") {}
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppColors.backgroundColor,
          padding: const EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              StreamBuilder<void>(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  final now = snapshot.data as DateTime? ?? DateTime.now();
                  return AppBottomBarClock(
                    now: now,
                    description: now.ddMMM,
                  );
                },
              ),
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
                  runSpacing: 16,
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
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                ),
                child: HtmlWidget(
                  controller.tipesIntercampi,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
