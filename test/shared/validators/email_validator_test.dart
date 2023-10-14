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
        () {
          final result = emailValidator.validate();
          expect(result, 'O e-mail é obrigatório');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o e-mail seja vazio',
        () {
          final result = emailValidator.validate(email: '');
          expect(result, 'O e-mail é obrigatório');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o e-mail seja inválido',
        () {
          final result = emailValidator.validate(email: 'maisa');
          expect(result, 'O e-mail é inválido');
        },
      );

      test(
        'deve retornar nulo caso o e-mail seja válido',
        () {
          final result = emailValidator.validate(email: 'maisa@gmail.com');
          expect(result, isNull);
        },
      );
    },
  );
}
