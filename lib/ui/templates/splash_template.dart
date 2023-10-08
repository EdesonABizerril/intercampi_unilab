import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../assets/assets.dart';
import '../theme/theme.dart';

class SplashTemplate extends StatelessWidget {
  const SplashTemplate({
    super.key,
    required this.controller,
  });

  final SplashController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Column(
              children: [
                Image.asset(
                  AppImagePath.logoWithName,
                  width: 140,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "app_catchphrase".tr,
                    style: AppStyle.body.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary.withOpacity(0.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    "by Edeson Bizerril",
                    style: AppStyle.body.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
                FutureBuilder<String>(
                  future: controller.version,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "v${(snapshot.data ?? "")}",
                        style: AppStyle.body,
                      ),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
