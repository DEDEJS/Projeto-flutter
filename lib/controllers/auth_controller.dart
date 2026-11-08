import 'package:flutter/material.dart';

class AuthController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    return email.isNotEmpty && password.isNotEmpty;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
