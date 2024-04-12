import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';

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
              context.read<AuthenticationBloc>().add(FinishedOnboarding());
            },
            child: const Text('Authentication'),
          ),
        ],
      ),
    );
  }
}
