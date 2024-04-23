part of 'router.dart';

GoRoute _splashRoute = GoRoute(
  path: splashPath,
  pageBuilder: (context, state) => _getPage(
    child: const SplashPage(),
    state: state,
  ),
);

GoRoute _onboardRoute = GoRoute(
  path: onboardPath,
  pageBuilder: (context, state) => _getPage(
    child: const OnboardingPage(),
    state: state,
  ),
);

GoRoute _questFormRoute = GoRoute(
  path: questFormPath,
  pageBuilder: (context, state) => _getPage(
    child: const QuestFormPage(),
    state: state,
  ),
);
