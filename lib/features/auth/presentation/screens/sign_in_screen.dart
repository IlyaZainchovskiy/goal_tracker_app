import 'package:flutter/material.dart';
import 'package:goal_tracker_app/core/services/firebase_auth_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  void _signIn() async {
    try {
      final user = await _authService.signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Помилка входу: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Вхід")),
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
            ElevatedButton(onPressed: _signIn, child: const Text("Увійти")),
          ],
        ),
      ),
    );
  }
}
