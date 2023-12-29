import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/helpers.dart';
import '../../../routes/routes.dart';
import '../atoms/atoms.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSimpleAppBar(
          title: "Intercampi",
          actions: [
            IconButton(
              onPressed: () {
                sharedTextData(title: "shared".tr, content: "shared_text_with_link".tr);
              },
              icon: const Icon(Icons.share),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: "about",
                    child: Text("about".tr),
                  ),
                ],
                onSelected: (value) {
                  if (value == "about") {
                    AppNavigator.to.about();
                  }
                },
              ),
            ),
          ],
        ),
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
      ],
    );
  }
}
