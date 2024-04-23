import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/core/models/formatters/numbers.dart';
import 'package:sidequest/core/models/mngr_system.dart';
import 'package:sidequest/core/widgets/brand_card.dart';
import 'package:sidequest/features/quest_form/bloc/quest_form_cubit.dart';

class QuestFormDetails extends StatelessWidget {
  const QuestFormDetails({
    super.key,
    required this.formKey,
    required this.manager,
  });

  final GlobalKey<FormBuilderState> formKey;
  final SystemManager manager;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestFormCubit, QuestFormState>(
      builder: (context, state) {
        return BrandCard.flat(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Icon(LineIcons.list, size: 18),
                  SizedBox(width: 10),
                  Text('Quest Summary'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Experience Reward',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    NumberFormatter.decimal(state.experienceReward),
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Gold Reward',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    NumberFormatter.decimal(state.totalGoldReward),
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
