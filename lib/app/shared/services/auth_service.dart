import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/user_controller.dart';
import 'package:minimal_social_media/app/shared/models/user_model.dart';
import 'package:minimal_social_media/app/shared/private/back_4_app_headers.dart';
import 'package:minimal_social_media/app/shared/validators/confirm_password_validator.dart';
import 'package:minimal_social_media/app/shared/validators/email_validator.dart';
import 'package:minimal_social_media/app/shared/validators/password_validator.dart';
import 'package:minimal_social_media/app/shared/validators/username_validator.dart';

class Auth {
  final Dio dio;
  final UserController userController = Get.find<UserController>();

  Auth({required this.dio});

  Future<String?> signIn({String? email, String? password}) async {
    try {
      final String? emailError =
          await EmailValidator().validate(email: email, login: true);
      final String? passwordError =
          PasswordValidator().validate(password: password);

      final String? resultValidators = emailError ?? passwordError;

      if (resultValidators == null) {
        final result = await dio.post(
          'https://parseapi.back4app.com/functions/signin',
          options: Options(
            contentType: 'application/json',
            headers: {
              'X-Parse-Application-Id': Back4AppHeaders().xParseApplicationId,
              'X-Parse-REST-API-Key': Back4AppHeaders().xParseRestApiKey,
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
          queryParameters: {"email": email, "password": password},
        );

        if (result.statusCode == 200 &&
            (result.data["result"] as Map).containsKey("token")) {
          userController.setUser(
            newUser: UserModel.fromJson(
              (result.data["result"] as Map<String, dynamic>),
            ),
          );
          return null;
        } else {
          if (((result.data as Map).containsValue('INVALID_CREDENTIALS'))) {
            return 'Email e/ou senha inválidos';
          }
          return "Ocorreu um erro ao realizar o login";
        }
      }

      return resultValidators;
    } catch (e) {
      debugPrint('An error occurred during login: $e');
      return "Ocorreu um erro ao realizar o login";
    }
  }

  Future<String?> signUp({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) async {
    try {
      final String? usernameError =
          await UsernameValidator().validate(username: username);
      final String? emailError = await EmailValidator().validate(email: email);
      final String? passwordError = PasswordValidator().validate(
        password: password,
      );
      final String? confirmPasswordError = ConfirmPasswordValidator()
          .validate(password: password, confirmPassword: confirmPassword);

      final String? resultValidators =
          usernameError ?? emailError ?? passwordError ?? confirmPasswordError;

      if (resultValidators == null) {
        final result = await dio.post(
          'https://parseapi.back4app.com/functions/signup',
          options: Options(
            contentType: 'application/json',
            headers: {
              'X-Parse-Application-Id': Back4AppHeaders().xParseApplicationId,
              'X-Parse-REST-API-Key': Back4AppHeaders().xParseRestApiKey,
            },
          ),
          queryParameters: {
            "username": username,
            "email": email,
            "password": password
          },
        );

        if (result.statusCode == 200 &&
            (result.data["result"] as Map).containsKey("token")) {
          userController.setUser(
            newUser: UserModel.fromJson(
              (result.data["result"] as Map<String, dynamic>),
            ),
          );
          return null;
        } else {
          return "Ocorreu um erro ao realizar o cadastro";
        }
      }

      return resultValidators;
    } catch (e) {
      debugPrint('An error occurred during registration: $e');
      return "Ocorreu um erro ao realizar o cadastro";
    }
  }
}
