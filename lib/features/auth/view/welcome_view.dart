import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/features/auth/bloc/login/login_cubit.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Logo"),
              const Text("Welcome Back"),
              const Text("Glad to see you!"),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  minimumSize: const Size(double.maxFinite, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                onPressed: () => context.push('/auth/login'),
                child: const Text('SIGN IN'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.maxFinite, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                onPressed: () => context.push('/auth/register'),
                child: const Text('SIGN UP'),
              )
            ],
          ),
        ),
        Column(
          children: [
            const Text('Continue with', style: TextStyle(fontSize: 13)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    surfaceTintColor: Colors.blue,
                    shape: const CircleBorder(),
                    visualDensity: VisualDensity.comfortable,
                    splashFactory: InkSplash.splashFactory,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Icon(
                    LineIcons.facebookF,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().logInWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    surfaceTintColor: Colors.red,
                    shape: const CircleBorder(),
                    visualDensity: VisualDensity.comfortable,
                    splashFactory: InkSplash.splashFactory,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Icon(
                    LineIcons.googleLogo,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showToast(
                      "Coming soon",
                      context: context,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    surfaceTintColor: Colors.black,
                    shape: const CircleBorder(),
                    visualDensity: VisualDensity.comfortable,
                    splashFactory: InkSplash.splashFactory,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Icon(
                    LineIcons.apple,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
