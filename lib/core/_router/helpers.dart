part of 'router.dart';

const String splashPath = '/';
const String onboardPath = '/onboarding';

// --- AUTHENTICATION
const String authPath = '/auth';
const String loginPath = 'login';
const String registerPath = 'register';
const String forgotPasswordPath = 'forgot-password';

// --- HOME
const String questsPath = '/quests';
const String explorePath = '/explore';
const String chatPath = '/chat';
const String othersPath = '/others';

// --- ACCOUNT
const String accountPath = '/account';
const String editProfilePath = 'edit-profile';
const String addressesPath = 'addresses';
const String contactNumberPath = 'contact-number';

const String questFormPath = '/quest-form';

const List<String> _protected = [
  questsPath,
  explorePath,
  chatPath,
  othersPath,

  /// -- User
  accountPath,

  // -- Quests
  questFormPath,
];

Page _getPage({required Widget child, required GoRouterState state}) {
  return MaterialPage(key: state.pageKey, child: child);
}

FutureOr<String?> _rootRedirects({
  required BuildContext context,
  required GoRouterState state,
  required AuthenticationBloc authBloc,
}) {
  final authStatus = authBloc.state;
  final paths = state.fullPath?.split('/').where((e) => e.isNotEmpty) ?? [];

  if (authStatus is AuthUnknown) {
    if (paths.contains(onboardPath.replaceFirst('/', ''))) return null;
    return onboardPath;
  }

  if (authStatus is AuthUnauthenticated) {
    if (paths.contains(authPath.replaceFirst('/', ''))) return null;
    return authPath;
  }

  if (authStatus is AuthAuthenticated) {
    final flatRoutes = _protected.map((e) => e.replaceFirst('/', ''));
    if (paths.any((p) => flatRoutes.any((e) => e == p))) return null;
    return questsPath;
  }

  return null;
}
