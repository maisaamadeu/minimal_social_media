class UsernameValidator {
  String? validate({String? username}) {
    List<String> usernamesList = ['maisa', 'ana'];

    if (username == null || username == '') {
      return 'O nome de usuário é obrigatório';
    }

    if (username.length < 3) {
      return 'O nome de usuário tem que ter no mínimo 3 caracteres';
    }

    for (var usernameInList in usernamesList) {
      if (usernameInList == username) {
        return 'O nome de usuário já está sendo utilizado';
      }
    }

    return null;
  }
}
