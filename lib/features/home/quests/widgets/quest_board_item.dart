import 'package:flutter/material.dart';
import 'package:sidequest/core/models/m_quest.dart';
import 'package:sidequest/core/widgets/brand_card.dart';
import 'package:sidequest/core/widgets/separated_column.dart';

class QuestBoardItem extends StatelessWidget {
  const QuestBoardItem({super.key, required this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    return BrandCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SeparatedColumn(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            children: [
              Row(
                children: [
                  Badge(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    label: Text('Lvl ${quest.levelRequired}'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      quest.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: const Text(
                      'View',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Text(
                quest.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Exp: ${quest.expReward}'),
                Text('Gold: ${quest.currencyReward}'),
                const Text('5 minutes ago'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
