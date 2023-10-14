import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_social_media/shared/validators/confirm_password_validator.dart';

void main() {
  late ConfirmPasswordValidator confirmPasswordValidator;

  setUp(() {
    confirmPasswordValidator = ConfirmPasswordValidator();
  });

  group(
    'validação da confirmação de senha',
    () {
      test(
        'deve retornar uma mensagem de erro caso a confirmação de senha seja nula',
        () {
          final result = confirmPasswordValidator.validate();

          expect(result, 'A confirmação de senha é obrigatória');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a confirmação de senha seja vazia',
        () {
          final result = confirmPasswordValidator.validate(confirmPassword: '');

          expect(result, 'A confirmação de senha é obrigatória');
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a confirmação de senha seja diferente da senha original',
        () {
          final result = confirmPasswordValidator.validate(
              password: 'Maisa@123', confirmPassword: 'a');

          expect(result, 'As senhas não coincidem');
        },
      );

      test(
        'deve retornar nulo caso a confirmação de senha seja válida',
        () {
          final result = confirmPasswordValidator.validate(
              password: 'Maisa@123', confirmPassword: 'Maisa@123');

          expect(result, isNull);
        },
      );
    },
  );
}
