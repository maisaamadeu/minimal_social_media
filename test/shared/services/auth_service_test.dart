import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_social_media/shared/services/auth_service.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });

  group(
    'validação do cadastro',
    () {
      test(
        'deve retornar uma mensagem de erro para um nome de usuário, email, senha e confirmação de senha inválidos',
        () {
          final result = auth.register();

          expect(result, isA<String>());
        },
      );

      test(
        'deve retornar nulo para um nome de usuário, email, senha e confirmação de senha válidos',
        () {
          final result = auth.register(
            email: 'maisa@gmail.com',
            password: 'Maisa@123',
            username: 'Deheane',
            confirmPassword: 'Maisa@123',
          );

          expect(result, isNull);
        },
      );
    },
  );

  group(
    'validação do login',
    () {
      test(
        'deve retornar uma mensagem de erro para um email e senha inválidos',
        () {
          final result = auth.login(email: 'willian', password: '123');

          expect(result, isA<String>());
        },
      );

      test(
        'deve retornar nulo para um email e senha válidos',
        () {
          final result =
              auth.login(email: 'maisa@gmail.com', password: 'Maisa@123');

          expect(result, isNull);
        },
      );
    },
  );
}
