import 'package:flutter/material.dart';
import 'package:minimal_social_media/app/pages/login_page.dart';
import 'package:minimal_social_media/app/shared/themes/dark_mode.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode,
      home: const LoginPage(),
    );
  }
}
