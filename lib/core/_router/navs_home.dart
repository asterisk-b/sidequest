part of 'router.dart';

_getHomeBottomNavigation({
  required GlobalKey<NavigatorState> rootKey,
  required GlobalKey<NavigatorState> questsKey,
  required GlobalKey<NavigatorState> exploreKey,
  required GlobalKey<NavigatorState> chatKey,
  required GlobalKey<NavigatorState> accountKey,
}) {
  return StatefulShellRoute.indexedStack(
    parentNavigatorKey: rootKey,
    branches: [
      StatefulShellBranch(
        navigatorKey: questsKey,
        routes: [
          GoRoute(
            path: questsPath,
            pageBuilder: (context, state) {
              return _getPage(child: const QuestPage(), state: state);
            },
          )
        ],
      ),
      StatefulShellBranch(
        navigatorKey: exploreKey,
        routes: [
          GoRoute(
            path: explorePath,
            pageBuilder: (context, state) {
              return _getPage(child: const ExplorePage(), state: state);
            },
          )
        ],
      ),
      StatefulShellBranch(
        navigatorKey: chatKey,
        routes: [
          GoRoute(
            path: chatPath,
            pageBuilder: (context, state) {
              return _getPage(child: const ChatPage(), state: state);
            },
          )
        ],
      ),
      StatefulShellBranch(
        navigatorKey: accountKey,
        routes: [
          GoRoute(
            path: othersPath,
            pageBuilder: (context, state) {
              return _getPage(child: const OthersPage(), state: state);
            },
          )
        ],
      ),
    ],
    pageBuilder: (context, state, shell) {
      return _getPage(child: HomePageWrapper(child: shell), state: state);
    },
  );
}
