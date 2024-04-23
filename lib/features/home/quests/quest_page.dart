import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/features/home/quests/bloc/quest_cubit.dart';
import 'package:sidequest/features/home/quests/view/quest_board.dart';
import 'package:sidequest/features/home/quests/widgets/quest_appbar.dart';

class QuestPage extends StatelessWidget {
  const QuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => QuestCubit()),
      ],
      child: const DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: QuestAppBar(),
          body: TabBarView(children: [
            QuestBoard(),
            Center(child: Text("Ongoing Quests")),
            Center(child: Text("My Quests")),
          ]),
          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {},
          //   shape: CircleBorder(),
          //   // label: const Text('sd'),
          //   label: Icon(Icons.add),
          // ),
        ),
      ),
    );
  }
}
