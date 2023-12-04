// ignore_for_file: must_be_immutable

import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Return component
class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor of generic tab bar navigation.
  const AppTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
    this.indicatorWeight = 2.0,
    this.isScrollable = false,
    this.backgroundColor,
  }) : assert(
          tabs.length == tabController.length,
          'The length of controller and tabs length need the same quantity.',
        );

  /// The controller of tabs.
  ///
  /// The length of controller and tabs length
  /// need the same quantity.
  final TabController tabController;

  /// The list of tabs.
  final List<Tab> tabs;

  /// The weight of indicator.
  final double indicatorWeight;

  /// The default height of tab.
  static const _kTabHeight = 48.0;

  /// The default height of tab.
  final bool isScrollable;

  /// The background color of tab.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      key: key,
      isScrollable: isScrollable,
      controller: tabController,
      overlayColor: MaterialStateProperty.all(backgroundColor ?? AppColors.primary),
      unselectedLabelColor: Colors.white,
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      labelStyle: AppStyle.body.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      unselectedLabelStyle: AppStyle.body.copyWith(
        color: Colors.white,
        fontSize: 14,
      ),
      dividerColor: Colors.white,
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize {
    double maxHeight = _kTabHeight;
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight);
  }
}
