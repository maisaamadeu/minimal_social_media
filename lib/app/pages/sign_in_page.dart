import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/pages/sign_up_page.dart';
import 'package:minimal_social_media/app/shared/controllers/auth_controller.dart';
import 'package:minimal_social_media/app/shared/widgets/my_elevated_button.dart';
import 'package:minimal_social_media/app/shared/widgets/my_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                    onPressed: () async {
                      authController.login(
                        context: context,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
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
                        builder: (context) => const SignUpPage(),
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
        ),
      ),
    );
  }
}
