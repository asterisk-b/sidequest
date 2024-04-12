// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
// import 'package:sidequest/features/app.dart';
// import 'package:sidequest/features/auth/authentication_page.dart';
// import 'package:sidequest/features/auth/view/forgot_password_page.dart';
// import 'package:sidequest/features/auth/view/login_page.dart';
// import 'package:sidequest/features/auth/view/register_page.dart';
// import 'package:sidequest/features/home/account/account_page.dart';
// import 'package:sidequest/features/home/home_page.dart';
// import 'package:sidequest/features/home/quests/quest_page.dart';
// import 'package:sidequest/features/notfound/not_found_page.dart';
// import 'package:sidequest/features/onboarding/onboarding_page.dart';
// import 'package:sidequest/features/splash/splash_page.dart';
// import 'package:sidequest/injection.dart';
//
// const mainPaths = ['quests', 'account'];
//
// class BlocListenable<T> extends ChangeNotifier implements Listenable {
//   final BlocBase<T> bloc;
//
//   BlocListenable(this.bloc) {
//     bloc.stream.listen((event) {
//       notifyListeners();
//     });
//   }
//
//   @override
//   void dispose() {
//     bloc.close();
//     super.dispose();
//   }
// }
//
// mixin RouterMixin on State<AppView> {
//   static final _rootNavigatorKey = GlobalKey<NavigatorState>(
//     debugLabel: 'RootNavigator',
//   );
//
//   static final _authNavigatorKey = GlobalKey<NavigatorState>(
//     debugLabel: 'AuthNavigator',
//   );
//
//   static final _homeNavigatorKey = GlobalKey<NavigatorState>(
//     debugLabel: 'HomeNavigator',
//   );
//
//   final _router = GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: '/',
//     errorBuilder: (_, state) => const NotFoundPage(),
//     routes: <RouteBase>[
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const SplashPage(),
//       ),
//       GoRoute(
//         path: '/onboarding',
//         builder: (context, state) => const OnboardingPage(),
//       ),
//       GoRoute(
//         path: '/auth',
//         builder: (context, state) => const AuthPage(),
//         routes: [
//           GoRoute(
//             path: 'login',
//             builder: (context, state) => const LoginPage(),
//           ),
//           GoRoute(
//             path: 'register',
//             builder: (context, state) => const RegisterPage(),
//           ),
//           GoRoute(
//             path: 'forgot-password',
//             builder: (context, state) => const ForgotPasswordPage(),
//           ),
//         ],
//       ),
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, child) => HomePage(child: child),
//         branches: [
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                   path: '/quests',
//                   builder: (context, state) => const QuestPage()),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                   path: '/account',
//                   builder: (context, state) => const AccountPage()),
//             ],
//           )
//         ],
//       ),
//     ],
//     redirect: (context, state) async {
//       final status = gt<AuthenticationBloc>().state;
//       final paths = state.fullPath?.split('/').where((e) => e.isNotEmpty) ?? [];
//
//       if (status is AuthUnknown) {
//         if (paths.contains('onboarding')) return null;
//         return '/onboarding';
//       }
//
//       if (status is AuthUnauthenticated) {
//         if (paths.contains('auth')) return null;
//         return '/auth';
//       }
//
//       if (status is AuthAuthenticated) {
//         if (paths.any((p) => mainPaths.any((e) => e == p))) return null;
//         return '/quests';
//       }
//
//       return null;
//     },
//     refreshListenable: BlocListenable(gt<AuthenticationBloc>()),
//   );
//
//   GoRouter get routes => _router;
// }
