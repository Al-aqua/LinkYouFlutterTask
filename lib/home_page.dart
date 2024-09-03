import 'package:flutter/material.dart';
import 'package:linkyou_flutter_task/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthService().logout();
            Navigator.pushReplacementNamed(context, '/');
          },
          child: const Text('logout'),
        ),
      ),
    );
  }
}
