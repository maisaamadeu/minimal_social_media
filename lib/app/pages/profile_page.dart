import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/user_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: EdgeInsets.all(25),
              child: Icon(
                Icons.person,
                size: 64,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              userController.user.value?.username ?? "Sem nome de perfil",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              userController.user.value?.email ?? "Sem endereço de e-mail",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
