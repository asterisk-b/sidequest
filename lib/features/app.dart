import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/core/router.dart';
import 'package:sidequest/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => gt<AuthenticationBloc>(),
        ),
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

class _AppViewState extends State<AppView> with RouterMixin {
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
      child: MaterialApp.router(
        routerConfig: routes,
        title: 'Sidequest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        ),
      ),
    );
  }
}
