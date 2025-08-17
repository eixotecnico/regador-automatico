import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const RegadorApp());
}

class RegadorApp extends StatelessWidget {
  const RegadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Regador Automático',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF015A84),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF015A84),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const TelaLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}