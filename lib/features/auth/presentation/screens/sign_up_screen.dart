import 'package:flutter/material.dart';
import 'package:goal_tracker_app/core/services/firebase_auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  void _signUp() async {
    try {
      final user = await _authService.signUpWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Помилка реєстрації: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Реєстрація")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "E-mail")),
            TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Пароль"),
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _signUp, child: const Text("Зареєструватись")),
          ],
        ),
      ),
    );
  }
}
