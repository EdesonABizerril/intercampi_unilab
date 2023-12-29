import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class AppSimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppSimpleAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.backgroundColor,
    this.textStyle,
    this.bottom,
    this.height = kToolbarHeight,
    this.elevation = 0,
  });

  final String title;
  final List<Widget> actions;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final PreferredSizeWidget? bottom;
  final double height;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      title: Text(
        title,
        style: textStyle ??
            AppStyle.body.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
      ),
      elevation: elevation,
      titleSpacing: 24,
      backgroundColor: backgroundColor ?? AppColors.primary,
      centerTitle: false,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
