import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth View'),
      ),
      body: const Center(
        child: Text('Auth View'),
      ),
    );
  }
}
