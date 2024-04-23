import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 13.5,
        );

    return AppBar(
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.notifications_outlined),
      // ),
      // centerTitle: true,
      title: const Text('Chat'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
        ),
      ],
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(height: 43, child: Text('World', style: textStyle)),
          Tab(height: 43, child: Text('Guild', style: textStyle)),
          Tab(height: 43, child: Text('Private', style: textStyle)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
