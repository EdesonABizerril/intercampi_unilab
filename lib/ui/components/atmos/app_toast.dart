import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class NsxAppToast extends StatelessWidget {
  factory NsxAppToast.success({
    required String label,
    VoidCallback? onTapClose,
  }) =>
      NsxAppToast._(
        label: label,
        backgroundColor: AppColors.positiveMedium,
        borderColor: AppColors.positive,
        textColor: AppColors.black,
        onTapClose: onTapClose,
      );

  factory NsxAppToast.error({
    required String label,
    VoidCallback? onTapClose,
  }) =>
      NsxAppToast._(
        label: label,
        backgroundColor: AppColors.negativeMedium,
        borderColor: AppColors.negative,
        textColor: AppColors.black,
        onTapClose: onTapClose,
      );

  factory NsxAppToast.info({
    required String label,
    VoidCallback? onTapClose,
  }) =>
      NsxAppToast._(
        label: label,
        backgroundColor: AppColors.primary,
        borderColor: AppColors.primaryDark,
        textColor: AppColors.black,
        onTapClose: onTapClose,
      );

  const NsxAppToast._({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    this.onTapClose,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback? onTapClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 40,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: AppStyle.body.copyWith(
                color: textColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTapClose?.call();
            },
            child: Icon(
              Icons.close,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
