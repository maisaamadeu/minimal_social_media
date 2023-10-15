import 'package:dio/dio.dart';
import 'package:minimal_social_media/shared/private/back_4_app_headers.dart';
import 'package:minimal_social_media/shared/validators/confirm_password_validator.dart';
import 'package:minimal_social_media/shared/validators/email_validator.dart';
import 'package:minimal_social_media/shared/validators/password_validator.dart';
import 'package:minimal_social_media/shared/validators/username_validator.dart';

class Auth {
  final Dio dio;

  Auth({required this.dio});

  Future<String?> login({String? email, String? password}) async {
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
          ),
          queryParameters: {"email": email, "password": password},
        );

        if (result.statusCode == 200 &&
            (result.data["result"] as Map).containsKey("token")) {
          return null;
        } else {
          return "Ocorreu um erro ao realizar o login";
        }
      }

      return resultValidators;
    } catch (e) {
      print('An error occurred during login: $e');
      return "Ocorreu um erro ao realizar o login";
    }
  }

  Future<String?> register({
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
          return null;
        } else {
          return "Ocorreu um erro ao realizar o cadastro";
        }
      }

      return resultValidators;
    } catch (e) {
      print('An error occurred during registration: $e');
      return "Ocorreu um erro ao realizar o cadastro";
    }
  }
}
