import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_social_media/shared/validators/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });

  group(
    'validação do e-mail',
    () {
      test(
        'deve retornar uma mensagem de erro caso o e-mail seja nulo',
        () async {
          final result = await emailValidator.validate();
          expect(result, 'O e-mail é obrigatório');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o e-mail seja vazio',
        () async {
          final result = await emailValidator.validate(email: '');
          expect(result, 'O e-mail é obrigatório');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o e-mail seja inválido',
        () async {
          final result = await emailValidator.validate(email: 'maisa');
          expect(result, 'O e-mail é inválido');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a lista de e-mails seja nula',
        () async {
          final result = await emailValidator.validate(email: 'maisa');
          expect(
              result, 'Ocorreu um erro ao buscar os emails no banco de dados');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o email ja esteja em uso',
        () async {
          final result =
              await emailValidator.validate(email: 'maisa@gmail.com');
          expect(result, 'O email já está sendo utilizado');
        },
      );

      test(
        'deve retornar nulo caso o e-mail seja válido',
        () async {
          final result =
              await emailValidator.validate(email: 'maisa@gmail.com');
          expect(result, isNull);
        },
      );
    },
  );
}
