part of 'router.dart';

const String splashPath = '/';
const String onboardPath = '/onboarding';

const String authPath = '/auth';
const String loginPath = 'login';
const String registerPath = 'register';
const String forgotPasswordPath = 'forgot-password';

const String questsPath = '/quests';
const String explorePath = '/explore';
const String chatPath = '/chat';
const String accountPath = '/account';

List<String> _getHomePaths() {
  return [
    accountPath.replaceFirst('/', ''),
    explorePath.replaceFirst('/', ''),
    chatPath.replaceFirst('/', ''),
    questsPath.replaceFirst('/', ''),
  ];
}

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
    if (paths.any((p) => _getHomePaths().any((e) => e == p))) return null;
    return questsPath;
  }

  return null;
}
