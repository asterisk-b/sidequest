import 'package:flutter/material.dart';

class QuestSliverAppBar extends SliverPersistentHeaderDelegate {
  final double height;
  final VoidCallback onFilter;
  final VoidCallback onNotification;

  QuestSliverAppBar({
    required this.height,
    required this.onFilter,
    required this.onNotification,
  });

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final bool showControls = shrinkOffset > 0;

    return Container(
      clipBehavior: Clip.antiAlias,
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
            // return SlideTransition(
            //   position: Tween<Offset>(
            //     begin: const Offset(0, 1),
            //     end: Offset.zero,
            //   ).animate(animation),
            //   child: child,
            // );
          },
          child: showControls ? _collapsedWidget : _expandedWidget,
        ),
      ),
    );
  }

  final Widget _expandedWidget = const TextField(
    readOnly: true,
    decoration: InputDecoration(
      hintText: 'Find quest',
      prefixIcon: Icon(Icons.search),
    ),
  );

  final Widget _collapsedWidget = Row(
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications, size: 20),
      ),
      const SizedBox(width: 5),
      const Expanded(
        child: TextField(
          readOnly: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Find quest',
          ),
        ),
      ),
      const SizedBox(width: 5),
      SizedBox(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune, size: 20),
        ),
      )
    ],
  );

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(QuestSliverAppBar oldDelegate) {
    return height != oldDelegate.height || height != oldDelegate.height;
  }
}
