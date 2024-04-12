import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/features/auth/authentication_page.dart';
import 'package:sidequest/features/auth/view/forgot_password_page.dart';
import 'package:sidequest/features/auth/view/login_page.dart';
import 'package:sidequest/features/auth/view/register_page.dart';
import 'package:sidequest/features/home/account/account_page.dart';
import 'package:sidequest/features/home/chat/chat_page.dart';
import 'package:sidequest/features/home/explore/expore_page.dart';
import 'package:sidequest/features/home/home_page.dart';
import 'package:sidequest/features/home/quests/quest_page.dart';
import 'package:sidequest/features/onboarding/onboarding_page.dart';
import 'package:sidequest/features/splash/splash_page.dart';

part 'helpers.dart';
part 'navs_auth.dart';
part 'navs_home.dart';

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

class BrandNavigation {
  static late GoRouter router;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _questsNavigatorKey = GlobalKey<NavigatorState>();
  static final _exploreNavigatorKey = GlobalKey<NavigatorState>();
  static final _chatNavigatorKey = GlobalKey<NavigatorState>();
  static final _accountNavigatorKey = GlobalKey<NavigatorState>();

  // factory BrandNavigation() => _instance;

  static BrandNavigation get instance {
    assert(_instance._initialized, 'Router not initialized');
    return _instance;
  }

  static void initialize(AuthenticationBloc authBloc) {
    assert(!_instance._initialized, 'This instance is already initialized');
    _instance._init(authBloc);
  }

  BrandNavigation._();
  static final BrandNavigation _instance = BrandNavigation._();
  bool _initialized = false;
  // static final _instance = BrandNavigation._internal();

  void _init(AuthenticationBloc authBloc) {
    final routes = <RouteBase>[
      GoRoute(
        path: splashPath,
        pageBuilder: (context, state) => _getPage(
          child: const SplashPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: onboardPath,
        pageBuilder: (context, state) => _getPage(
          child: const OnboardingPage(),
          state: state,
        ),
      ),
      _getAuthenticationNavigation(
        rootKey: _rootNavigatorKey,
      ),
      _getHomeBottomNavigation(
        rootKey: _rootNavigatorKey,
        questsKey: _questsNavigatorKey,
        exploreKey: _exploreNavigatorKey,
        chatKey: _chatNavigatorKey,
        accountKey: _accountNavigatorKey,
      ),
    ];
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: questsPath,
      routes: routes,
      redirect: (context, state) => _rootRedirects(
        context: context,
        state: state,
        authBloc: authBloc,
      ),
      // refreshListenable: BlocListenable(gt<AuthenticationBloc>()),
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
    );

    _initialized = true;
  }
}
