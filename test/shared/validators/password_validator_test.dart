import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_social_media/shared/validators/password_validator.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group(
    'validação da senha',
    () {
      test(
        'deve retornar uma mensagem de erro caso a senha seja nula',
        () {
          final result = passwordValidator.validate();
          expect(result, 'A senha é obrigatória');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha seja vazia',
        () {
          final result = passwordValidator.validate(password: '');
          expect(result, 'A senha é obrigatória');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha seja menor que 8 caracteres',
        () {
          final result = passwordValidator.validate(password: 'maisa');
          expect(result, 'A senha deve possuir pelo menos 8 caracteres');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha não seja alfanumérica',
        () {
          final result = passwordValidator.validate(password: 'maisaamadeu');
          expect(result, 'A senha deve ser alfanumérica');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha não possua letras maiúsculas',
        () {
          final result = passwordValidator.validate(password: 'maisaamadeu123');
          expect(result, 'A senha deve possuir pelo menos 1 letra maiúscula');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha não possua letras minúsculas',
        () {
          final result = passwordValidator.validate(password: 'MAISAAMADEU123');
          expect(result, 'A senha deve possuir pelo menos 1 letra minúscula');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha não possua caracteres especiais',
        () {
          final result = passwordValidator.validate(password: 'Maisaamadeu123');
          expect(
              result, 'A senha deve possuir pelo menos 1 carcatere especial');
        },
      );

      test(
        'deve retornar nulo caso a senha seja válida',
        () {
          final result =
              passwordValidator.validate(password: 'Maisaamadeu@123');
          expect(result, isNull);
        },
      );
    },
  );
}
