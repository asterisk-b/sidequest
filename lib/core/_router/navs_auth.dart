part of 'router.dart';

_getAuthenticationNavigation({required GlobalKey<NavigatorState> rootKey}) {
  return GoRoute(
    parentNavigatorKey: rootKey,
    path: authPath,
    pageBuilder: (context, state) {
      return _getPage(child: const AuthPage(), state: state);
    },
    routes: [
      GoRoute(
        path: loginPath,
        pageBuilder: (context, state) {
          return _getPage(child: const LoginPage(), state: state);
        },
      ),
      GoRoute(
        path: registerPath,
        pageBuilder: (context, state) {
          return _getPage(child: const RegisterPage(), state: state);
        },
      ),
      GoRoute(
        path: forgotPasswordPath,
        pageBuilder: (context, state) {
          return _getPage(child: const ForgotPasswordPage(), state: state);
        },
      ),
    ],
  );
}
