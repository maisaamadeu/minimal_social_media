import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/pages/home_page.dart';
import 'package:minimal_social_media/app/pages/profile_page.dart';
import 'package:minimal_social_media/app/pages/sign_in_page.dart';
import 'package:minimal_social_media/app/pages/users_page.dart';
import 'package:minimal_social_media/app/shared/controllers/user_controller.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // DrawerHeader com um ícone de coração
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              // Opção de página inicial
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text(
                  'PÁGINA INICIAL',
                  style: TextStyle(
                    letterSpacing: 5,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => HomePage());
                },
              ),
              // Opção de perfil
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text(
                  'PERFIL',
                  style: TextStyle(
                    letterSpacing: 5,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => ProfilePage());
                },
              ),
              // Opção de usuários
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text(
                  'USUÁRIOS',
                  style: TextStyle(
                    letterSpacing: 5,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => UsersPage());
                },
              ),
            ],
          ),
          // Opção de sair
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: const Text(
              'SAIR',
              style: TextStyle(
                letterSpacing: 5,
              ),
            ),
            onTap: () {
              userController.setUser();
              Get.off(
                () => const SignInPage(),
              );
            },
          ),
        ],
      ),
    );
  }
}
