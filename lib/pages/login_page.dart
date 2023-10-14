import 'package:flutter/material.dart';
import 'package:minimal_social_media/pages/register_page.dart';
import 'package:minimal_social_media/shared/services/auth_service.dart';
import 'package:minimal_social_media/shared/widgets/my_elevated_button.dart';
import 'package:minimal_social_media/shared/widgets/my_error_snack_bar.dart';
import 'package:minimal_social_media/shared/widgets/my_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Auth _auth = Auth();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person,
                color: colorScheme.inversePrimary,
                size: 80,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'MINIMALISTA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colorScheme.inversePrimary,
                  fontSize: 20,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextFormField(
                controller: _passwordController,
                hintText: 'Senha',
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  color: colorScheme.secondary,
                ),
                textAlign: TextAlign.end,
              ),
              const SizedBox(
                height: 25,
              ),
              MyElevatedButton(
                onPressed: () {
                  String? result = _auth.login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  if (result != null) {
                    myErrorSnackBar(context, result);
                  } else {
                    // TODO: REALIZAR O LOGIN
                  }
                },
                backgroundColor: colorScheme.primary,
                text: 'Entrar',
                colorText: colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                  (route) => false,
                ),
                child: const Text.rich(
                  TextSpan(
                    text: 'Não possui uma conta? ',
                    children: [
                      TextSpan(
                        text: 'Crie uma aqui',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
