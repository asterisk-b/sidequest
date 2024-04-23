import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/core/models/formatters/numbers.dart';
import 'package:sidequest/core/widgets/brand_card.dart';
import 'package:sidequest/features/quest_form/bloc/quest_form_cubit.dart';

class QuestPaymentDetails extends StatelessWidget {
  const QuestPaymentDetails({super.key});

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
                  Icon(LineIcons.receipt, size: 18),
                  SizedBox(width: 10),
                  Text('Payment Details'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Questors', style: TextStyle(fontSize: 13)),
                  Text(
                    state.maxQuestors.toString(),
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Reward per Questor',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    state.currencyRewards.toString(),
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Reward Subtotal',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    NumberFormatter.decimal(state.totalGoldReward),
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Service Fee', style: TextStyle(fontSize: 13)),
                  Text(
                    NumberFormatter.decimal(state.serviceFee),
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Payment'),
                  Text(
                    NumberFormatter.currency(state.totalPayment),
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
