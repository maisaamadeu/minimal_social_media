import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/theme_controller.dart';
import 'package:minimal_social_media/app/shared/controllers/user_controller.dart';
import 'package:minimal_social_media/app/shared/widgets/my_drawer.dart';
import 'package:minimal_social_media/app/shared/widgets/my_post_button.dart';
import 'package:minimal_social_media/app/shared/widgets/my_text_form_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ThemeController themeController = Get.find<ThemeController>();
  final UserController userController = Get.find<UserController>();

  final TextEditingController newPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('PAREDE'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: MyTextFormField(
                      controller: newPostController,
                      hintText: 'Diga algo...',
                      obscureText: false,
                    ),
                  ),
                  MyPostButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
