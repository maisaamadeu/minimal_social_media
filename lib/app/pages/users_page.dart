import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/users_controller.dart';
import 'package:minimal_social_media/app/shared/models/user_model.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});

  final UsersController usersController =
      Get.put<UsersController>(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () {
          if (usersController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            );
          } else if (usersController.users.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Ocorreu um erro ao buscar os dados dos usários, tente novamente mais tarde',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 22,
                  ),
                ),
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              itemBuilder: (context, index) {
                final UserModel user = usersController.users[index];

                return ListTile(
                  title: Text(user.username),
                  subtitle: Text(user.email),
                );
              },
              // separatorBuilder: (context, index) => Divider(),
              itemCount: usersController.users.length,
            );
          }
        },
      ),
    );
  }
}
