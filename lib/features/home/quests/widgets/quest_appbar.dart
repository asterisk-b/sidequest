import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sidequest/core/_router/router.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/features/home/quests/bloc/quest_cubit.dart';

class QuestAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuestAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: BlocBuilder<QuestCubit, QuestState>(
        buildWhen: (p, c) => p.questFilterMode != c.questFilterMode,
        builder: (context, state) {
          return SegmentedButton<QuestTypes>(
            showSelectedIcon: false,
            segments: QuestTypes.values.map((e) {
              return ButtonSegment(value: e, label: Text(e.label));
            }).toList(),
            selected: {state.questFilterMode},
            onSelectionChanged: (value) {
              context.read<QuestCubit>().switchQuestFilterMode(value.first);
            },
          );
        },
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined),
      ),
      actions: [
        IconButton(
          onPressed: () => context.push(questFormPath),
          icon: const Icon(Icons.add),
        ),
      ],
      bottom: const TabBar(
        tabs: [
          Tab(height: 43, text: 'Quest Board'),
          Tab(height: 43, text: 'Ongoing Quests'),
          Tab(height: 43, text: 'My Quests'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
