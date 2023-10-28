import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/pages/login_page.dart';
import 'package:minimal_social_media/app/shared/controllers/auth_controller.dart';
import 'package:minimal_social_media/app/shared/widgets/my_elevated_button.dart';
import 'package:minimal_social_media/app/shared/widgets/my_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    controller: _usernameController,
                    hintText: 'Nome de Usuário',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
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
                  MyTextFormField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirme a Senha',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyElevatedButton(
                    onPressed: () async {
                      authController.register(
                        context: context,
                        username: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirmPassword: _confirmPasswordController.text,
                      );
                    },
                    backgroundColor: colorScheme.primary,
                    text: 'Cadastrar',
                    colorText: colorScheme.inversePrimary,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false,
                    ),
                    child: const Text.rich(
                      TextSpan(
                        text: 'Já possui uma conta? ',
                        children: [
                          TextSpan(
                            text: 'Entre aqui',
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
