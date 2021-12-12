import 'package:get/get.dart';
import 'package:flutter/material.dart';

void showSnackbar(String title, String message,{
  Color? color,
  Color? background,
  Duration? duration,
  SnackPosition? position,
  Icon? icon,
  Widget? messageText,
  Widget? titleText,
  double? borderRadius
}) {
  Get.snackbar(
    title,
    message,
    messageText: messageText,
    titleText: titleText,
    snackPosition: position ?? SnackPosition.BOTTOM,
    backgroundColor: background ?? Colors.redAccent,
    icon: icon,
    borderRadius: borderRadius ?? 16,
    margin: const EdgeInsets.all(15),
    colorText: color ?? Colors.white,
    duration: duration ?? const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
