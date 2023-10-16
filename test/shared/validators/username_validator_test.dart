import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_social_media/app/shared/validators/username_validator.dart';

void main() {
  late UsernameValidator usernameValidator;

  setUp(() {
    usernameValidator = UsernameValidator();
  });

  group(
    'validação do nome de usuário',
    () {
      test(
        'deve retornar uma mensagem de erro caso o nome de usuário seja nulo',
        () {
          final result = usernameValidator.validate();

          expect(result, 'O nome de usuário é obrigatório');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o nome de usuário seja vazio',
        () {
          final result = usernameValidator.validate(username: '');

          expect(result, 'O nome de usuário é obrigatório');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o nome de usuário seja menor que 3 caracteres',
        () {
          final result = usernameValidator.validate(username: 'a');

          expect(
              result, 'O nome de usuário tem que ter no mínimo 3 caracteres');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o nome de usuário já esteja sendo utilizado',
        () {
          final result = usernameValidator.validate(username: 'maisa');

          expect(result, 'O nome de usuário já está sendo utilizado');
        },
      );

      test(
        'deve retornar nulo caso o nome de usuário seja válido',
        () {
          final result = usernameValidator.validate(username: 'deheane');

          expect(result, isNull);
        },
      );
    },
  );
}
