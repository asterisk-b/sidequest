import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';
import 'package:sidequest/features/quest_form/bloc/quest_form_cubit.dart';
import 'package:sidequest/features/quest_form/view/form_container.dart';

class QuestFormPage extends StatelessWidget {
  const QuestFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      appBar: AppBar(
        title: const Text('Create a quest'),
        // actions: [
        //   SegmentedButton<QuestTypes>(
        //     showSelectedIcon: false,
        //     segments: QuestTypes.values.where((e) => e.official).map((e) {
        //       return ButtonSegment(value: e, label: Text(e.label));
        //     }).toList(),
        //     selected: const {QuestTypes.solo},
        //     onSelectionChanged: (value) {},
        //   ),
        //   const SizedBox(width: 15),
        // ],
      ),
      child: BlocProvider(
        create: (context) => QuestFormCubit(),
        child: QuestFormContainer(),
      ),
    );
  }
}
