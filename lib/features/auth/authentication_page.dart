import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/core/bloc/app_settings/app_settings_cubit.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Welcome!',
          style: TextStyle(fontSize: 16),
        ),
      ),
      padding: const EdgeInsets.all(40),
      child: const _Welcome(),
    );
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Logo"),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => context.push('/auth/login'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, 45),
                ),
                child: const Text('SIGN IN'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => context.push('/auth/register'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, 45),
                ),
                child: const Text('SIGN UP'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<AppSettingsCubit>()
                            .switchTheme(ThemeMode.dark);
                      },
                      child: const Text('DARK'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<AppSettingsCubit>()
                            .switchTheme(ThemeMode.light);
                      },
                      child: const Text('LIGHT'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<AppSettingsCubit>()
                            .switchTheme(ThemeMode.system);
                      },
                      child: const Text('SYSTEM'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            const Text('Continue with', style: TextStyle(fontSize: 13)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue,
                    surfaceTintColor: Colors.blue,
                  ),
                  icon: const Icon(LineIcons.facebookF, color: Colors.white),
                ),
                const SizedBox(width: 13),
                IconButton(
                  // context.read<LoginCubit>().logInWithGoogle();
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red,
                    surfaceTintColor: Colors.red,
                  ),
                  icon: const Icon(LineIcons.googleLogo, color: Colors.white),
                ),
                const SizedBox(width: 13),
                IconButton(
                  onPressed: () {
                    showToast("Coming soon", context: context);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black87,
                    surfaceTintColor: Colors.black87,
                  ),
                  icon: const Icon(LineIcons.apple, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
