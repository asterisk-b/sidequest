import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/features/app.dart';
import 'package:sidequest/features/auth/authentication_page.dart';
import 'package:sidequest/features/home/account/account_page.dart';
import 'package:sidequest/features/home/home_page.dart';
import 'package:sidequest/features/home/quests/quest_page.dart';
import 'package:sidequest/features/onboarding/onboarding_page.dart';
import 'package:sidequest/features/splash/splash_page.dart';
import 'package:sidequest/injection.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

mixin RouterMixin on State<AppView> {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'RootNavigator',
  );

  static final _homeNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'HomeNavigator',
  );

  final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) => HomePage(child: child),
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                  path: '/quests',
                  name: 'Quests',
                  builder: (context, state) {
                    return const QuestPage();
                  }),
              GoRoute(
                  path: '/account',
                  name: 'Account',
                  builder: (context, state) {
                    return const AccountPage();
                  }),
            ],
          )
        ],
      ),
    ],
    redirect: (context, state) async {
      final status = context.read<AuthenticationBloc>().state;

      if (status is AuthUnknown) {
        return '/onboarding';
      }

      if (status is AuthUnauthenticated) {
        return '/auth';
      }

      if (status is AuthAuthenticated) {
        return '/quests';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(gt<AuthenticationBloc>().stream),
  );

  GoRouter get routes => _router;
}
