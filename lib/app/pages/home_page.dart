import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/pages/sign_in_page.dart';
import 'package:minimal_social_media/app/shared/controllers/theme_controller.dart';
import 'package:minimal_social_media/app/shared/controllers/user_controller.dart';
import 'package:minimal_social_media/app/shared/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ThemeController themeController = Get.find<ThemeController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Página Inicial'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              userController.setUser();
              Get.off(() => const SignInPage());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              userController.user.value!.email.toString(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
