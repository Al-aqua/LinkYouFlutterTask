import 'package:flutter/material.dart';
import 'package:linkyou_flutter_task/api.dart';
import 'package:linkyou_flutter_task/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  signIn(BuildContext context) async {
    final navigator = Navigator.of(context);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final user = await AuthService().signInWithGoogle();
    if (user != null) {
      final response = await Api().postUser(user.user!.displayName);
      if (response.contains('user created successfully')) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(response),
          ),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(response),
          ),
        );
      }
      navigator.pushReplacementNamed('/home_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinkYou Flutter Task'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () => signIn(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/google_icon.png',
                  width: 64,
                  height: 64,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Login with Google',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
