import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class AppCardSelect extends StatelessWidget {
  const AppCardSelect({
    super.key,
    required this.from,
    required this.to,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.onTap,
    this.height = 100,
    this.width = 280,
  });

  final String from;
  final String to;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.grey,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: borderColor ?? AppColors.borderGrey,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 6,
              offset: const Offset(2, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              from,
              textAlign: TextAlign.center,
              style: AppStyle.body.copyWith(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            icon ?? const SizedBox.shrink(),
            const SizedBox(
              width: 8,
            ),
            Text(
              to,
              textAlign: TextAlign.center,
              style: AppStyle.body.copyWith(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
