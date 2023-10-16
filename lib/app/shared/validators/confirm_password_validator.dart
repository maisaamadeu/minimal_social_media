class ConfirmPasswordValidator {
  String? validate({String? password, String? confirmPassword}) {
    if (confirmPassword == null || confirmPassword == '') {
      return 'A confirmação de senha é obrigatória';
    }

    if (confirmPassword != password) {
      return 'As senhas não coincidem';
    }

    return null;
  }
}
