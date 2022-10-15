import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/themes/light_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "KASWA TASK",
      theme: getLightTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
