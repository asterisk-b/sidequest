import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Onboarding"),
          ElevatedButton(
            onPressed: () {
              context.go('/auth');
            },
            child: const Text('Authentication'),
          ),
        ],
      ),
    );
  }
}
