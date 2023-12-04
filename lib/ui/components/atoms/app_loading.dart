import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    required this.child,
    required this.enable,
    this.backgroundColor,
    this.loadingColor,
    this.padding,
  });

  final Widget child;
  final bool enable;
  final Color? backgroundColor;
  final Color? loadingColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: enable,
          child: ColoredBox(
            color: backgroundColor ?? Colors.black12.withOpacity(0.5),
            child: Center(
              child: Padding(
                padding: padding ?? EdgeInsets.zero,
                child: CircularProgressIndicator(
                  color: loadingColor ?? Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
