import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sidequest/core/_router/router.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activities'),
          actions: [
            TextButton.icon(
              onPressed: () {
                context.push(questFormPath);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                splashFactory: NoSplash.splashFactory,
              ),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Create Quest'),
            ),
            const SizedBox(width: 10),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(height: 43, text: 'Ongoing Quests'),
              Tab(height: 43, text: 'My Quests'),
              Tab(height: 43, text: 'History'),
            ],
          ),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nothing is happening now', textAlign: TextAlign.center),
            Text(
              'When you use our services, you will see them here',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        // body: const Center(child: Text("Activities")),
      ),
    );
  }
}
