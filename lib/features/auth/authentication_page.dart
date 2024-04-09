import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const Text("Logo"),
              const Text("Welcome Back"),
              ElevatedButton(onPressed: () {}, child: const Text('Sign In')),
              ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
              const Text('Continue with'),
              const Row(
                children: [
                  Text("google"),
                  Text("facebook"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
