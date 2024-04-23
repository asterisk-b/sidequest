part of 'router.dart';

_getAccountNavigation({required GlobalKey<NavigatorState> rootKey}) {
  return GoRoute(
    parentNavigatorKey: rootKey,
    path: accountPath,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const AccountPage(),
        transitionDuration: const Duration(milliseconds: 250),
        transitionsBuilder: (context, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn)),
            child: child,
          );
        },
      );
    },
    routes: [
      GoRoute(
        path: editProfilePath,
        pageBuilder: (context, state) {
          return _getPage(child: const EditProfilePage(), state: state);
        },
      ),
      GoRoute(
        path: addressesPath,
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
