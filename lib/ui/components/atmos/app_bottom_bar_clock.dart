import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../theme/theme.dart';

class AppBottomBarClock extends StatelessWidget implements PreferredSizeWidget {
  const AppBottomBarClock({
    super.key,
    required this.now,
    required this.description,
    this.backgroundColor,
    this.height = 80.0,
  });

  final Color? backgroundColor;
  final String description;
  final DateTime now;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: backgroundColor ?? AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                now.toTimeString(),
                style: AppStyle.body.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
            ),
            Text(
              description,
              style: AppStyle.body.copyWith(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
