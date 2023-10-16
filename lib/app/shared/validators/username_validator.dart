import 'package:dio/dio.dart';
import 'package:minimal_social_media/app/shared/repositories/users_repository.dart';

class UsernameValidator {
  Future<String?> validate({String? username}) async {
    if (username == null || username == '') {
      return 'O nome de usuário é obrigatório';
    }

    if (username.length < 3) {
      return 'O nome de usuário tem que ter no mínimo 3 caracteres';
    }

    List<String>? usernames = await UsersRepository(dio: Dio()).getUsernames();
    if (usernames == null) {
      return 'Ocorreu um erro ao buscar os nomes de usuários no banco de dados';
    }

    for (var usernameInList in usernames) {
      if (usernameInList == username) {
        return 'O nome de usuário já está sendo utilizado';
      }
    }

    return null;
  }
}
