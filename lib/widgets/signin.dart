import 'package:flutter/material.dart';
import 'signup.dart';
import 'reset_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Контролери для зчитування тексту з полів вводу
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignIn() {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();

    if (login.isEmpty || password.isEmpty) {
      // Повідомлення про помилку, якщо поля пусті
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Будь ласка, заповніть усі поля!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Повідомлення про успішний вхід
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Успішний вхід для користувача: $login!'),
          backgroundColor: Colors.green,
        ),
      );
      // Тут можна додати перехід на головний екран додатка
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизація'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, size: 80, color: Colors.blue),
                const SizedBox(height: 32),

                // Поле логіна з контролером
                TextField(
                  controller: _loginController,
                  decoration: const InputDecoration(
                    labelText: 'Логін або Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),

                // Поле пароля з контролером
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _handleSignIn, // Виклик функції перевірки та повідомлення
                    child: const Text('Увійти', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                    );
                  },
                  child: const Text('Забули пароль?'),
                ),

                const SizedBox(height: 8),

                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: const Text('Створити акаунт (Реєстрація)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}