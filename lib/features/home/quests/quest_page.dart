import 'package:flutter/material.dart';
import 'package:sidequest/features/home/quests/view/quest_board.dart';
import 'package:sidequest/features/home/quests/widgets/quest_sliver_appbar.dart';

class QuestPage extends StatelessWidget {
  const QuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, scrolled) {
          return [
            SliverAppBar(
              shape: const Border(bottom: BorderSide.none),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, size: 20),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune, size: 20),
                )
              ],
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: QuestSliverAppBar(
                height: 60 + MediaQuery.of(context).viewPadding.top,
                onFilter: () {},
                onNotification: () {},
              ),
            )
          ];
        },
        body: const QuestBoard(),
      ),
    );

    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => QuestCubit()),
    //   ],
    //   child: const DefaultTabController(
    //     length: 3,
    //     initialIndex: 1,
    //     child: Scaffold(
    //       appBar: QuestAppBar(),
    //       body: TabBarView(children: [
    //         QuestBoard(),
    //         Center(child: Text("Ongoing Quests")),
    //         Center(child: Text("My Quests")),
    //       ]),
    //     ),
    //   ),
    // );
  }
}
