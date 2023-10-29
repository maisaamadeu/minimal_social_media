import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/users_controller.dart';
import 'package:minimal_social_media/app/shared/repositories/users_repository.dart';

class Users {
  final Dio dio;
  final UsersController usersController = Get.find<UsersController>();

  Users({required this.dio});

  Future<String?> getUsers() async {
    try {
      final result = await UsersRepository(dio: dio).getUsers();

      if (result != null) {}
    } catch (e) {
      debugPrint('Ocorreu um erro ao recuperar os dados dos usuários: $e');
      return 'Ocorreu um erro ao recuperar os dados dos usuários.';
    }
    return null;
  }
}
