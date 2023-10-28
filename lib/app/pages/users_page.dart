import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media/app/shared/repositories/users_repository.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    users = await UsersRepository(dio: Dio()).getUsers() ?? [];
  }

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
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var result = await UsersRepository(dio: Dio()).getUsers();
              for (var user in result ?? []) {
                print(user['id']);
              }
            },
            child: Text('Teste')),
      ),
    );
  }
}
