import 'package:flutter/material.dart';
import 'package:sidequest/core/widgets/copy_text.dart';
import 'package:sidequest/core/widgets/separated_column.dart';

class AccountPageAppBar extends StatelessWidget {
  const AccountPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight * 1.5,
        bottom: kToolbarHeight / 2.2,
        left: kToolbarHeight / 2.2,
        right: kToolbarHeight / 2.2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: SeparatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (_, index) => const SizedBox(height: 5),
                  children: [
                    Text(
                      'Name Name',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Text('@username'),
                    const CopyText(
                      label: 'UID: 7ef3bbbc-ff47-4be4-a19f-9573aed2fed3',
                      copyable: 'copied',
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('A'),
              Text('B'),
              Text('C'),
            ],
          )
        ],
      ),
    );
  }
}
