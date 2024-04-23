import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/bloc/user/user_cubit.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/core/widgets/separated_column.dart';
import 'package:sidequest/core/widgets/stat_card.dart';

class AdventurerBadge extends StatelessWidget {
  const AdventurerBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withAlpha(180),
      child: BlocBuilder<UserCubit, UserState>(
        buildWhen: (p, c) => p.user != c.user,
        builder: (context, state) {
          return SeparatedColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.user.fullName),
                  Text('Lvl: ${state.user.level}'),
                ],
              ),
              Text(state.user.bio ?? '-'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...WalletCurrency.values.map((currency) {
                    return Expanded(
                      child: StatCard(
                        icon: Icon(
                          currency.icon,
                          color: currency.color,
                          size: 18,
                        ),
                        title: currency.label,
                        value: 0.toString(),
                      ),
                    );
                  }),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
