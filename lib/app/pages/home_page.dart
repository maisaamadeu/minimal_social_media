import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 80,
            ),
            Text(
              'Home Page',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                print(themeController.lightMode.value);
                themeController
                    .switchApplicationMode(!themeController.lightMode.value);
              },
              child: Text(
                'Trocar tema',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
