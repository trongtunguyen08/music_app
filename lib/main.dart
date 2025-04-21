import 'package:flutter/material.dart';
import 'package:music_app/core/theme/theme.dart';
import 'package:music_app/features/auth/view/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
