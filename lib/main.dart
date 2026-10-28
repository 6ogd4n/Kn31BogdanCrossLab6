  import 'package:flutter/material.dart';
  import 'widgets/signin.dart';

  void main() {
    runApp(const AuthApp());
  }

  class AuthApp extends StatelessWidget {
    const AuthApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Auth App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const SignInScreen(), // Прибрано зайві помилки
      );
    }
  }