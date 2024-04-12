import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:sidequest/core/_router/router.dart';
import 'package:sidequest/core/bloc/app_settings/app_settings_cubit.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/core/theme/theme.dart';
import 'package:sidequest/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppSettingsCubit()),
        BlocProvider(create: (_) => gt<AuthenticationBloc>()),
      ],
      child: const StyledToast(
        locale: Locale('en', 'US'),
        backgroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 14.0, color: Colors.white),
        toastPositions: StyledToastPosition.top,
        toastAnimation: StyledToastAnimation.slideFromTopFade,
        animDuration: Duration(milliseconds: 200),
        reverseAnimation: StyledToastAnimation.fade,
        curve: Curves.ease,
        reverseCurve: Curves.ease,
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final theme = AppTheme();

  final int requiredSeconds = 2;
  DateTime? currentBackPressTime;
  bool canPopNow = false;

  void onPopInvoked(bool didPop) {
    final DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) >
            Duration(seconds: requiredSeconds)) {
      currentBackPressTime = now;

      showToast("Press back again to exit", context: context);

      // Fluttertoast.showToast(msg: "Press back again to exit");

      Future.delayed(Duration(seconds: requiredSeconds), () {
        setState(() => canPopNow = false);
        ToastManager().dismissAll(showAnim: false);
        // Fluttertoast.cancel();
      });
    }
    setState(() => canPopNow = true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPopNow,
      onPopInvoked: onPopInvoked,
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: BrandNavigation.router,
            title: 'Sidequest',
            debugShowCheckedModeBanner: false,
            themeMode: state.mode,
            theme: FlexThemeData.light(
              scheme: FlexScheme.tealM3,
              useMaterial3: true,
            ),
            darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.tealM3,
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
