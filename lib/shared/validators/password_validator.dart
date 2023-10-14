class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password == '') {
      return 'A senha é obrigatória';
    }

    if (password.length < 8) {
      return 'A senha deve possuir pelo menos 8 caracteres';
    }

    final alphanumericRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).+$');
    if (!alphanumericRegex.hasMatch(password)) {
      return 'A senha deve ser alfanumérica';
    }

    final uppercaseRegex = RegExp(r'[A-Z]');
    if (!uppercaseRegex.hasMatch(password)) {
      return 'A senha deve possuir pelo menos 1 letra maiúscula';
    }

    final lowercaseRegex = RegExp(r'[a-z]');
    if (!lowercaseRegex.hasMatch(password)) {
      return 'A senha deve possuir pelo menos 1 letra minúscula';
    }

    final specialCharactersRegex = RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]');
    if (!specialCharactersRegex.hasMatch(password)) {
      return 'A senha deve possuir pelo menos 1 carcatere especial';
    }

    return null;
  }
}
