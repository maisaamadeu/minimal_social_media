import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/pages/home_page.dart';
import 'package:minimal_social_media/app/shared/services/auth_service.dart';
import 'package:minimal_social_media/app/shared/widgets/my_error_snack_bar.dart';

class AuthController extends GetxController {
  final Auth _auth = Auth(dio: Dio());

  Future<void> login(
      {required BuildContext context, String? email, String? password}) async {
    String? result = await _auth.login(
      email: email,
      password: password,
    );

    if (context.mounted) {
      if (result != null) {
        myErrorSnackBar(context, result);
      } else {
        Get.off(() => HomePage());
      }
    }
    return;
  }

  Future<void> register(
      {required BuildContext context,
      String? username,
      String? email,
      String? password,
      String? confirmPassword}) async {
    String? result = await _auth.register(
      username: username,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    if (context.mounted) {
      if (result != null) {
        myErrorSnackBar(context, result);
      } else {
        Get.off(() => HomePage());
      }
    }
    return;
  }
}
