import 'package:flutter/material.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/core/models/m_quest.dart';
import 'package:sidequest/features/home/quests/widgets/quest_board_item.dart';

class QuestBoard extends StatelessWidget {
  const QuestBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.all(15),
      separatorBuilder: (_, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        return const QuestBoardItem(
          quest: Quest(
            id: '',
            title: 'Clean',
            description: 'Lorem ipsum',
            levelRequired: 1,
            currencyType: WalletCurrency.gold,
            currencyReward: 100,
            expReward: 0,
            maxQuestors: 10,
            status: QuestStatus.idle,
          ),
        );
      },
    );
  }
}
