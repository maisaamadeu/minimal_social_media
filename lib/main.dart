import 'package:flutter/material.dart';
import 'package:minimal_social_media/pages/login_page.dart';
import 'package:minimal_social_media/shared/themes/dark_mode.dart';
import 'package:minimal_social_media/shared/themes/light_mode.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: LoginPage(),
    );
  }
}
