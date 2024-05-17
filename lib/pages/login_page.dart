import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrition_app/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _controller.emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () => _controller.login(),
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () => _controller.register(),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
