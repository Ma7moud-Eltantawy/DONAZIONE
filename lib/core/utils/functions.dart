import 'package:flutter/material.dart' show Colors, Color, TextStyle;
import 'package:get/get.dart';

import '../manager/colors_manager.dart';


snackBarError(String error) {
  Get.snackbar(
    '',
    error,
    backgroundColor: ColorsManager.errorBG,
    colorText: ColorsManager.errorText,
  );
}

snackBarSuccess(String error) {
  Get.snackbar(
    '',
    error,
    backgroundColor: ColorsManager.white,
    colorText: ColorsManager.primary,
  );
}

getNameFromEmail(String email) {
  return email.split('@').first;
}

bool isPositive(String value) {
  final num = int.parse(value);
  return num > 0;
}

