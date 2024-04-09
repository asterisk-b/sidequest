import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/features/auth/bloc/login/login_cubit.dart';
import 'package:sidequest/features/auth/view/welcome_view.dart';
import 'package:sidequest/injection.dart';
import 'package:sidequest/repositories/auth_repository.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(gt<AuthRepository>())),
      ],
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: WelcomeView(),
        ),
      ),
    );
  }
}
