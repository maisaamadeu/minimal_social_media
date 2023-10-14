import 'package:minimal_social_media/shared/validators/confirm_password_validator.dart';
import 'package:minimal_social_media/shared/validators/email_validator.dart';
import 'package:minimal_social_media/shared/validators/password_validator.dart';
import 'package:minimal_social_media/shared/validators/username_validator.dart';

class Auth {
  String? login({String? email, String? password}) {
    final String? emailError = EmailValidator().validate(email: email);
    final String? passwordError =
        PasswordValidator().validate(password: password);

    final String? resultValidators = emailError ?? passwordError;

    if (resultValidators == null) {}

    return resultValidators;
  }

  String? register({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    final String? usernameError =
        UsernameValidator().validate(username: username);
    final String? emailError = EmailValidator().validate(email: email);
    final String? passwordError = PasswordValidator().validate(
      password: password,
    );
    final String? confirmPasswordError = ConfirmPasswordValidator()
        .validate(password: password, confirmPassword: confirmPassword);

    final String? resultValidators =
        usernameError ?? emailError ?? passwordError ?? confirmPasswordError;

    if (resultValidators == null) {}

    return resultValidators;
  }
}
