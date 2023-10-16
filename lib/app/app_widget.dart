import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/bindings/app_binding.dart';
import 'package:minimal_social_media/app/pages/login_page.dart';
import 'package:minimal_social_media/app/shared/controllers/theme_controller.dart';
import 'package:minimal_social_media/app/shared/themes/dark_mode.dart';
import 'package:minimal_social_media/app/shared/themes/light_mode.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        theme: themeController.lightMode.value ? lightMode : darkMode,
        initialBinding: AppBinding(),
        home: const LoginPage(),
      ),
    );
  }
}
