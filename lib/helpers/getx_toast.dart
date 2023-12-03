// ignore_for_file: inference_failure_on_function_invocation, unnecessary_lambdas

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/components/components.dart';

abstract class GetxToast {
  static void _genericSnack(Widget messageText) {
    Get.snackbar(
      "",
      "",
      titleText: Container(),
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      barBlur: 0,
      messageText: messageText,
      isDismissible: false,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
    );
  }

  static void toastError({required String message}) => _genericSnack(
        NsxAppToast.error(
          label: message,
          onTapClose: () => Get.back(),
        ),
      );

  static void toastInfo({required String message}) => _genericSnack(
        NsxAppToast.info(
          label: message,
          onTapClose: () => Get.back(),
        ),
      );

  static void toastSuccess({required String message}) => _genericSnack(
        NsxAppToast.success(
          label: message,
          onTapClose: () => Get.back(),
        ),
      );
}
