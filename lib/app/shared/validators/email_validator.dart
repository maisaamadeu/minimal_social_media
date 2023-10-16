import 'package:dio/dio.dart';
import 'package:minimal_social_media/app/shared/repositories/users_repository.dart';

class EmailValidator {
  Future<String?> validate({String? email, bool? login}) async {
    if (email == null || email == '') {
      return 'O e-mail é obrigatório';
    }

    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailRegex.hasMatch(email)) {
      return 'O e-mail é inválido';
    }

    if (login != true) {
      List<String>? emails = await UsersRepository(dio: Dio()).getEmails();
      if (emails == null) {
        return 'Ocorreu um erro ao buscar os emails no banco de dados';
      }

      for (var emailInList in emails) {
        if (emailInList == email) {
          return 'O email já está sendo utilizado';
        }
      }
    }

    return null;
  }
}
